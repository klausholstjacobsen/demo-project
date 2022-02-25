#include <DemoLib/DemoLib.h>
#include <fcntl.h>
#include <boost/filesystem.hpp>

namespace lsdc {
namespace common {
namespace DemoLib {

DemoLib::DemoLib()
{
}

DemoLib::~DemoLib()
{

}

std::string DemoLib::GetRandomString()
{
    return "Hello World!";
}

}}}
