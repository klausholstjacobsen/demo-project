#include <DemoExe.h>
#include <DemoLib/DemoLib.h>
#include <iostream>

namespace lsdc {
namespace common {
namespace DemoExe {

DemoExe::DemoExe()
{
}

DemoExe::~DemoExe()
{

}


}}}

int main (int argc, char *argv[])
{
    lsdc::common::DemoLib::DemoLib lib;
    auto random_string = lib.GetRandomString();
    std::cout << random_string << std::endl;
}
