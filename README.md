```
loadstart	浏览器开始在网上寻找媒体数据
progress	浏览器正在获取媒体数据
suspend	浏览器暂停获取媒体数据，但是下载过程并滑正常结束
abort	浏览器在下载完全部媒体数据之前中止获取媒体数据，但是并不是由错误引起的
error	获取媒体数据过程中出错
emptied	video元素或audio元素所在网络突然变为未初始化状态可能原因有两个:1.载入媒体过程中突然发生一个致命错误
```

### 在浏览器正在选择支持的播放格式时，又调用 了load方法重新载入媒体

```
stalled	浏览器尝试获取媒体数据失败
play	即将开始播放，当执行了play方法时触发，或数据下载后元素被设为autoplay属性
pause	播放暂停，当执行了pause方式时触发
loadedmetadata	浏览器获取完毕媒体的时间长和字节数
waiting	播放过程由于得不到下一帧而暂停播放（例如下一帧尚未加载完毕），但很快就能够得到下一帧
canplay	浏览器能够播放媒体，但估计以当前的播放速率不能直接播放完毕，播放期间需要缓冲
canplaythrough	浏览器能够播放媒体，而且以当前播放速率能够将媒体播放完毕，不再需要进行缓冲
seeking	seeking属性变为true，浏览器正在请求数据
seeked	seeking属性变为false，浏览器停止请求数据
timeupdate	由于播放位置被改变，可能是播放过程中的自然改变，也可能是被人为的改变，或由于播放不能连续而发生的跳变
ended	播放结束后停止播放
ratechange	defaultplaybackRate属性（默认播放速率）或playbackRate属性（当前播放速率）被改变
druationchange	播放时长被改变
volumechange	volume属性（音量）被改变或muted属性（静音状态）被改变
```

### video标签的属性

```
src ：视频的属性
poster：视频封面，没有播放时显示的图片
preload：预加载
autoplay：自动播放
loop：循环播放
controls：浏览器自带的控制条
width：视频宽度
height：视频高度
```