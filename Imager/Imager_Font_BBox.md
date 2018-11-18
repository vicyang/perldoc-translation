翻译：vicyang/523066680  
日期：2018-11  

Imager::Font::BBox - 字体包围盒(Bounding Box)对象  

语法  
```perl
use Imager::Font;
 
# get the object
my $font = Imager::Font->new(...);
my $bbox = $font->bounding_box(string=>$text, size=>$size);
 
# methods
my $start = $bbox->start_offset;
my $left_bearing = $bbox->left_bearing;
my $right_bearing = $bbox->right_bearing;
my $end = $bbox->end_offset;
my $gdescent = $box->global_descent;
my $gascent = $bbox->global_ascent;
my $ascent = $bbox->ascent;
my $decent = $bbox->descent;
my $total_width = $bbox->total_width;
my $fheight = $bbox->font_height;
my $theight = $bbox->text_height;
my $display_width = $bbox->display_width;
```
  
* 备注1  
  在数组（列表）环境下，bounding_box 返回数组：  
```
my ($neg_width,
    $global_descent,
    $pos_width,
    $global_ascent,
    $descent,
    $ascent,
    $advance_width,
    $right_bearing) = $font->bounding_box(string => "A Fool");
```
  
* 摘要  
  该对象通过在标量环境中调用 Imager::Font bounding_box() 获取，（数组环境中直接返回各项数值）  

* 方法  
  start_offset()  
  neg_width()  
  left_bearing()  
    返回首个字符左边边界到画布边界的距离。  
    如果值为正，则首个字位于绘制起点的右侧  
    别名： neg_width()    对应 bounding_box() 列表环境的返回值  
    别名： left_bearing() 用来对应字体相关的术语。   # 左啤线  

  advance_width()  
    表示字符串的外围宽度，在驱动支持的情况下。其他情况与 end_offset 值相同  
    The advance width of the string, if the driver supports that, otherwise the same as end_offset.  

  right_bearing()  
    最有一个字的右侧到外围边界的距离  
    如果字符右侧超出边界，则该值为负数  

  display_width()  
    字符串有效像素的横向距离  
    # 等于 advance_width - left_bearing - right_bearing  
  
  global_descent()  
    字符基线（baseline）到 全局字体边框底部的距离。（译注：基线以下的部分）  
    通常是负数  
    目前已知至少有一种字体此项数值为正数。  

  global_ascent()  
    字符基线（baseline）到 全局字体边框顶部的距离。（译注：基线以上的部分）  
    通常是正数  

  descent()  
    基线（baseline）到字符串底部像素的距离。  
    当字符串中任意一个字符边界向下超出baseline时，该值为负数。  
  
  ascent()  
    基线（baseline）到字符串顶部像素的距离。  
    当字符串中任意一个字符边界向上越过baseline时，该值为正数。  

  font_height()  
    该字体的最大显示高度（全局高度）。  

  text_height()  
    当前所提供字符串的有效像素高度。  

* ###补充  
  text_height = descent + ascent  

  

* 已经废弃的方法  
  这些方法带有bug，用于向后兼容，不应在新程序中使用。  

  total_width()  
    字符串的完整宽度  
    新程序应使用 display_width().  
    其结果依赖于 end_offset(), 以及受到向后兼容特性的局限性。  

  end_offset()  

  pos_width()  
    绘制边界到最后一个字符右边界的距离，应为正数  
    如果习惯用列表环境下的 bounding_box() 返回值，可以使用 pos_width() 别名。  
    为了向后兼容，该方法返回最大边界值。  

* INTERNAL FUNCTIONS  
  new(...)  
    Called by Imager::Font->bounding_box() to create the object.  

