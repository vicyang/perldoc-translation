* 使用条件  
  此模块假设您的系统已经安装了 OpenGL, GLU, 以及 GLUT 运行环境。  
  这些运行库的名字类似：libGL.so, libGLU.so, libglut.so (unix环境)  
  或者 opengl32.dll, glu32.dll (Windows环境)  

  如果引用 OpenGL::Image ，请使用OpenGL::Image v1.03 或者更高的版本  

* 描述  
  命名约定：  
  几乎支持所有的 OpenGL v1.0, v1.1, v1.2 版本的函数。  
  对于没有指针参数的函数，在Perl中的调用方法和C语言一致。  

  而使用Perl数组传参的函数做了明显的改动 -- 以获取多个参数或数组 -- 在C语言形式的函数名称基础上添加了 `_p` 后缀。  

  对于需要传递C指针参数的函数添加了对应的 `_c` 后缀。  
  这些函数配合 OpenGL::Array 模块使用（该模块允许用户从Perl分配C语言数组）  

  第三种后缀，`_s`, 对于大部分指针函数，从指针或者引用获取字符串参数，转换为Perl字节封装（packed）数据。  
  底层的OpenGL函数将传递一个指针到该数据。  

  A third variant, _s, exists for most pointer functions, and takes a string argument for each pointer or a reference to a Perl string containing packed data. The underlying OpenGL function will be passed a pointer to that data.