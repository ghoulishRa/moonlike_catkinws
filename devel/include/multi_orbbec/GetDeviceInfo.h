// Generated by gencpp from file multi_orbbec/GetDeviceInfo.msg
// DO NOT EDIT!


#ifndef MULTI_ORBBEC_MESSAGE_GETDEVICEINFO_H
#define MULTI_ORBBEC_MESSAGE_GETDEVICEINFO_H

#include <ros/service_traits.h>


#include <multi_orbbec/GetDeviceInfoRequest.h>
#include <multi_orbbec/GetDeviceInfoResponse.h>


namespace multi_orbbec
{

struct GetDeviceInfo
{

typedef GetDeviceInfoRequest Request;
typedef GetDeviceInfoResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct GetDeviceInfo
} // namespace multi_orbbec


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::multi_orbbec::GetDeviceInfo > {
  static const char* value()
  {
    return "a172c842ade7825e92d115b1aef6b0d1";
  }

  static const char* value(const ::multi_orbbec::GetDeviceInfo&) { return value(); }
};

template<>
struct DataType< ::multi_orbbec::GetDeviceInfo > {
  static const char* value()
  {
    return "multi_orbbec/GetDeviceInfo";
  }

  static const char* value(const ::multi_orbbec::GetDeviceInfo&) { return value(); }
};


// service_traits::MD5Sum< ::multi_orbbec::GetDeviceInfoRequest> should match
// service_traits::MD5Sum< ::multi_orbbec::GetDeviceInfo >
template<>
struct MD5Sum< ::multi_orbbec::GetDeviceInfoRequest>
{
  static const char* value()
  {
    return MD5Sum< ::multi_orbbec::GetDeviceInfo >::value();
  }
  static const char* value(const ::multi_orbbec::GetDeviceInfoRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::multi_orbbec::GetDeviceInfoRequest> should match
// service_traits::DataType< ::multi_orbbec::GetDeviceInfo >
template<>
struct DataType< ::multi_orbbec::GetDeviceInfoRequest>
{
  static const char* value()
  {
    return DataType< ::multi_orbbec::GetDeviceInfo >::value();
  }
  static const char* value(const ::multi_orbbec::GetDeviceInfoRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::multi_orbbec::GetDeviceInfoResponse> should match
// service_traits::MD5Sum< ::multi_orbbec::GetDeviceInfo >
template<>
struct MD5Sum< ::multi_orbbec::GetDeviceInfoResponse>
{
  static const char* value()
  {
    return MD5Sum< ::multi_orbbec::GetDeviceInfo >::value();
  }
  static const char* value(const ::multi_orbbec::GetDeviceInfoResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::multi_orbbec::GetDeviceInfoResponse> should match
// service_traits::DataType< ::multi_orbbec::GetDeviceInfo >
template<>
struct DataType< ::multi_orbbec::GetDeviceInfoResponse>
{
  static const char* value()
  {
    return DataType< ::multi_orbbec::GetDeviceInfo >::value();
  }
  static const char* value(const ::multi_orbbec::GetDeviceInfoResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MULTI_ORBBEC_MESSAGE_GETDEVICEINFO_H