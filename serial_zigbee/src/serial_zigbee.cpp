
#include <ros/ros.h>
#include <serial_zigbee.h>


int _pos[3] = {0,0,0};
int _angle[3] = {0,0,0};
int _check_sum = 0;
float float_angle[3];
float float_pos[3];
u_char begin[] = {0xfe,0x08,0x90,0x91,0x03,0x00};
u_char test_data[] = {0x23,0x23,0x23,0x23};
u_char end[] = {0xff};

SerialZigbee::SerialZigbee(ros::NodeHandle *nh):
    serial_num(""),
    baud_rate(0),
    time_out(0)
{
    nh->getParam("serial_zigbee_node/master_serial_num_", this->serial_num);
    nh->getParam("serial_zigbee_node/baudrate_", this->baud_rate);
    nh->getParam("serial_zigbee_node/time_out_", this->time_out);

    std::cout <<"serial_zigbee/master_serial_num_ "<<  this->serial_num << std::endl;
    std::cout <<"serial_zigbee/baudrate_ "<<  this->baud_rate << std::endl;
    std::cout <<"serial_zigbee/time_out_ "<<  this->time_out << std::endl;

    this->robotMoveServer = nh->advertiseService("robot_move_service", &SerialZigbee::ServiceCallback, this);

    //设置串口属性，并打开串口
    try
    {
        ser.setPort(this->serial_num);
        ser.setBaudrate(this->baud_rate);
        serial::Timeout to = serial::Timeout::simpleTimeout(this->time_out);
        ser.setTimeout(to);
        ser.open();
    }
    catch (serial::IOException& e)
    {
        ROS_ERROR_STREAM("Unable to open port ");
    }

//检测串口是否已经打开，并给出提示信息
    if(ser.isOpen())
    {
        ROS_INFO_STREAM("Serial Port initialized");
    }
    else
    {
        ROS_ERROR_STREAM("Serial Port initialized error");
    }

    while(ros::ok())
    {
        // serial_write_data();
        //  write_callback_test();
        // loop_rate.sleep();
     //   parse_serial_data();
        ros::Duration(0.0001).sleep();
        ros::spinOnce();
    }

}

SerialZigbee::~SerialZigbee()
{

}


void SerialZigbee::serial_write_data()
{
    for(int i = 0;i<3;i++)
    {
        _pos[i] = (int)(float_pos[i]*SCALE_F);
        _angle[i] = (int)(float_angle[i]*SCALE_F);
        _check_sum += _pos[i]+_angle[i];
    }
    ser.write(begin,6);
    ser.write(test_data,4);
    ser.write(end,1);
}

// 接受程序
void SerialZigbee::parse_serial_data(){

    // std::cout << "read\n";
    if(ser.available()){
        //std::cout << "available\n";
        static u_int8_t data;
        static u_int8_t buffer[8];
        ser.read(&data,1);//从串口读取数据并保存
        //std::cout << "read finish\n";
        // std::cout << data << std::endl;
        ROS_INFO("data[0] %X", data);
        if(data == 0xfe){
            data = '0';
            ser.read(&data,1);
            std::cout << data << std::endl;
            if (data == 0x08){
                ser.read(buffer,8);
                std::cout << data << std::endl;
                ROS_INFO("%X_%X_%X_%X_%X_%X_%X_%X",buffer[0],buffer[1],buffer[2],buffer[3],buffer[4],buffer[5],
                         buffer[6],buffer[7]);
            }
        }
    }
}

bool SerialZigbee::ServiceCallback(universal_msgs::RobotMove::Request &req, universal_msgs::RobotMove::Response &res)
{

    u_char begin[] = {0xfe,0x08,0x90,0x91,0x03,0x00};
    u_char test_data[] = {0x23,0x23,0x23,0x23};
    u_char end[] = {0xff};

    //
    begin[4] = req.robot_id;
    //std::cout << "target robot id: " << req.robot_id << std::endl;


    if((req.move_direction == 0) ||(req.move_direction == 1) || (req.move_direction == 2)|| (req.move_direction == 3)||(req.move_direction == 4))
    {
        test_data[0] = req.move_direction;
    }
    else
    {
        test_data[0] = 0;
    }
    std::cout << "move direction: "<< (int)test_data[0] << std::endl;

    if(req.speed_wheel_left > 180)
    {
        test_data[1] = 180;
    }
    else
    {
        test_data[1] = req.speed_wheel_left;
    }

    if(req.speed_wheel_right > 180)
    {
        test_data[2] = 180;
    }
    else
    {
        test_data[2] = req.speed_wheel_right;
    }

    if(req.time_span >= 254)
    {
        test_data[3] = 253;
    }
    else
    {
        test_data[3] = req.time_span;
    }

    if(! ser.isOpen())
    {
        std::cout << "serial not open!" << std::endl;
        res.success = false;
        return false;
    }

    ser.write(begin,6);
    ser.write(test_data,4);
    ser.write(end,1);

    res.success = true;
    return true;
}
