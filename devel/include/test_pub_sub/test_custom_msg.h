// Generated by gencpp from file test_pub_sub/test_custom_msg.msg
// DO NOT EDIT!


#ifndef TEST_PUB_SUB_MESSAGE_TEST_CUSTOM_MSG_H
#define TEST_PUB_SUB_MESSAGE_TEST_CUSTOM_MSG_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace test_pub_sub
{
template <class ContainerAllocator>
struct test_custom_msg_
{
  typedef test_custom_msg_<ContainerAllocator> Type;

  test_custom_msg_()
    : data()
    , counter(0)  {
    }
  test_custom_msg_(const ContainerAllocator& _alloc)
    : data(_alloc)
    , counter(0)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _data_type;
  _data_type data;

   typedef int32_t _counter_type;
  _counter_type counter;





  typedef boost::shared_ptr< ::test_pub_sub::test_custom_msg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::test_pub_sub::test_custom_msg_<ContainerAllocator> const> ConstPtr;

}; // struct test_custom_msg_

typedef ::test_pub_sub::test_custom_msg_<std::allocator<void> > test_custom_msg;

typedef boost::shared_ptr< ::test_pub_sub::test_custom_msg > test_custom_msgPtr;
typedef boost::shared_ptr< ::test_pub_sub::test_custom_msg const> test_custom_msgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::test_pub_sub::test_custom_msg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::test_pub_sub::test_custom_msg_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::test_pub_sub::test_custom_msg_<ContainerAllocator1> & lhs, const ::test_pub_sub::test_custom_msg_<ContainerAllocator2> & rhs)
{
  return lhs.data == rhs.data &&
    lhs.counter == rhs.counter;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::test_pub_sub::test_custom_msg_<ContainerAllocator1> & lhs, const ::test_pub_sub::test_custom_msg_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace test_pub_sub

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::test_pub_sub::test_custom_msg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::test_pub_sub::test_custom_msg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::test_pub_sub::test_custom_msg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::test_pub_sub::test_custom_msg_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::test_pub_sub::test_custom_msg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::test_pub_sub::test_custom_msg_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::test_pub_sub::test_custom_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "0fa0f9ced31bb7ac9407d6fdd3a2b92b";
  }

  static const char* value(const ::test_pub_sub::test_custom_msg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x0fa0f9ced31bb7acULL;
  static const uint64_t static_value2 = 0x9407d6fdd3a2b92bULL;
};

template<class ContainerAllocator>
struct DataType< ::test_pub_sub::test_custom_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "test_pub_sub/test_custom_msg";
  }

  static const char* value(const ::test_pub_sub::test_custom_msg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::test_pub_sub::test_custom_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string data\n"
"int32  counter\n"
;
  }

  static const char* value(const ::test_pub_sub::test_custom_msg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::test_pub_sub::test_custom_msg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.data);
      stream.next(m.counter);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct test_custom_msg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::test_pub_sub::test_custom_msg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::test_pub_sub::test_custom_msg_<ContainerAllocator>& v)
  {
    s << indent << "data: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.data);
    s << indent << "counter: ";
    Printer<int32_t>::stream(s, indent + "  ", v.counter);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TEST_PUB_SUB_MESSAGE_TEST_CUSTOM_MSG_H
