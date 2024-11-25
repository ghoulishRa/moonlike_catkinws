// Generated by gencpp from file multi_launch/GetCameraInfo.msg
// DO NOT EDIT!


#ifndef MULTI_LAUNCH_MESSAGE_GETCAMERAINFO_H
#define MULTI_LAUNCH_MESSAGE_GETCAMERAINFO_H

#include <ros/service_traits.h>


#include <multi_launch/GetCameraInfoRequest.h>
#include <multi_launch/GetCameraInfoResponse.h>


namespace multi_launch
{

struct GetCameraInfo
{

typedef GetCameraInfoRequest Request;
typedef GetCameraInfoResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct GetCameraInfo
} // namespace multi_launch


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::multi_launch::GetCameraInfo > {
  static const char* value()
  {
    return "aacf7dfed1a501be45f34981291a5579";
  }

  static const char* value(const ::multi_launch::GetCameraInfo&) { return value(); }
};

template<>
struct DataType< ::multi_launch::GetCameraInfo > {
  static const char* value()
  {
    return "multi_launch/GetCameraInfo";
  }

  static const char* value(const ::multi_launch::GetCameraInfo&) { return value(); }
};


// service_traits::MD5Sum< ::multi_launch::GetCameraInfoRequest> should match
// service_traits::MD5Sum< ::multi_launch::GetCameraInfo >
template<>
struct MD5Sum< ::multi_launch::GetCameraInfoRequest>
{
  static const char* value()
  {
    return MD5Sum< ::multi_launch::GetCameraInfo >::value();
  }
  static const char* value(const ::multi_launch::GetCameraInfoRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::multi_launch::GetCameraInfoRequest> should match
// service_traits::DataType< ::multi_launch::GetCameraInfo >
template<>
struct DataType< ::multi_launch::GetCameraInfoRequest>
{
  static const char* value()
  {
    return DataType< ::multi_launch::GetCameraInfo >::value();
  }
  static const char* value(const ::multi_launch::GetCameraInfoRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::multi_launch::GetCameraInfoResponse> should match
// service_traits::MD5Sum< ::multi_launch::GetCameraInfo >
template<>
struct MD5Sum< ::multi_launch::GetCameraInfoResponse>
{
  static const char* value()
  {
    return MD5Sum< ::multi_launch::GetCameraInfo >::value();
  }
  static const char* value(const ::multi_launch::GetCameraInfoResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::multi_launch::GetCameraInfoResponse> should match
// service_traits::DataType< ::multi_launch::GetCameraInfo >
template<>
struct DataType< ::multi_launch::GetCameraInfoResponse>
{
  static const char* value()
  {
    return DataType< ::multi_launch::GetCameraInfo >::value();
  }
  static const char* value(const ::multi_launch::GetCameraInfoResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MULTI_LAUNCH_MESSAGE_GETCAMERAINFO_H