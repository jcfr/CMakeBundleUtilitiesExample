#ifndef __MyLib4Plugin_h
#define __MyLib4Plugin_h


#if defined(MyLib4Plugin_EXPORTS)
  #define MYLIB4PLUGIN_EXPORT __attribute__((visibility("default")))
#else
  #define MYLIB4PLUGIN_EXPORT
#endif

// --------------------------------------------------------------------------
class MYLIB4PLUGIN_EXPORT MyLib4Plugin
{
public:
  void hello();
};

#endif 

