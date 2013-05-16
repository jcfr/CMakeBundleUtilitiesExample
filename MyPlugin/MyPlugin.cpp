
#include "MyPlugin.h"
#include "MyLib4Plugin.h"

// STD includes
#include <iostream>

// --------------------------------------------------------------------------
void MyPlugin::hello()
{
  MyLib4Plugin w;
  w.hello();
}

