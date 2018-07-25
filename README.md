
## 如何移除用for循环创建控件的CAShapelayer直线
#### 首先怎么删除cashapelayer的轨迹啦

```
[self.Layer removeFromSuperlayer];//通过申明属性的方式来删除

``` 

#### 如果要删除多个空间的cashapelayer的轨迹啦

  1.首先我们创建一个字典来记录这些添加过的layer
  2.删除时候，取出字典中的layer来进行删除