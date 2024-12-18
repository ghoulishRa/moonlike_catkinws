// Generated by gencpp from file multi_orbbec/GetCameraInfo.msg
// DO NOT EDIT!


#ifndef MULTI_ORBBEC_MESSAGE_GETCAMERAINFO_H
#define MULTI_ORBBEC_MESSAGE_GETCAMERAINFO_H

#include <ros/service_traits.h>


#include <multi_orbbec/GetCameraInfoRequest.h>
#include <multi_orbbec/GetCameraInfoResponse.h>


namespace multi_orbbec
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
} // namespace multi_orbbec


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::multi_orbbec::GetCameraInfo > {
  static const char* value()
  {
    return "aacf7dfed1a501be45f34981291a5579";
  }

  static const char* value(const ::multi_orbbec::GetCameraInfo&) { return value(); }
};

template<>
struct DataType< ::multi_orbbec::GetCameraInfo > {
  static const char* value()
  {
    return "multi_orbbec/GetCameraInfo";
  }

  static const char* value(const ::multi_orbbec::GetCameraInfo&) { return value(); }
};


// service_traits::MD5Sum< ::multi_orbbec::GetCameraInfoRequest> should match
// service_traits::MD5Sum< ::multi_orbbec::GetCameraInfo >
template<>
struct MD5Sum< ::multi_orbbec::GetCameraInfoRequest>
{
  static const char* value()
  {
    return MD5Sum< ::multi_orbbec::GetCameraInfo >::value();
  }
  static const char* value(const ::multi_orbbec::GetCameraInfoRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::multi_orbbec::GetCameraInfoRequest> should match
// service_traits::DataType< ::multi_orbbec::GetCameraInfo >
template<>
struct DataType< ::multi_orbbec::GetCameraInfoRequest>
{
  static const char* value()
  {
    return DataType< ::multi_orbbec::GetCameraInfo >::value();
  }
  static const char* value(const ::multi_orbbec::GetCameraInfoRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::multi_orbbec::GetCameraInfoResponse> should match
// service_traits::MD5Sum< ::multi_orbbec::GetCameraInfo >
template<>
struct MD5Sum< ::multi_orbbec::GetCameraInfoResponse>
{
  static const char* value()
  {
    return MD5Sum< ::multi_orbbec::GetCameraInfo >::value();
  }
  static const char* value(const ::multi_orbbec::GetCameraInfoResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::multi_orbbec::GetCameraInfoResponse> should match
// service_traits::DataType< ::multi_orbbec::GetCameraInfo >
template<>
struct DataType< ::multi_orbbec::GetCameraInfoResponse>
{
  static const char* value()
  {
    return DataType< ::multi_orbbec::GetCameraInfo >::value();
  }
  static const char* value(const ::multi_orbbec::GetCameraInfoResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MULTI_ORBBEC_MESSAGE_GETCAMERAINFO_H
