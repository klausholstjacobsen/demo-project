# demo-project

To build the demo project first you must get and install the required toolchain packages here:
https://github.com/klausholstjacobsen/conan-packages

The project supports build to two different platforms, x86_64 and armhf. These platforms are internally in this project called amd64_gcc8 and armhf_gcc8.

To setup the project to point to your specific conan remote create an env_personal.cmake file in the project root directory next to the env_project.cmake file.
Add these lines:
```
SET(DC_ARTIFACTORY_USER "[your_user]")
SET(DC_ARTIFACTORY_KEY "[your_password_hash]")
SET(DC_ARTIFACTORY "[your_conan_artifactory_remote]")
```

To build the project for one of the platforms amd64_gcc8 or armhf_gcc8 your use the DC_PLATFORM parameter to your cmake command.
The demo project has one libn target DemoLib and one executable target DemoExe.
To build do this:
```
cd [project_root_dir]
mkdir build_output
cd build_output
cmake -DDC_PLATFORM=amd64_gcc8 ..
make DemeExe
```
