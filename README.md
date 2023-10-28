# zygameui引擎例子
- HelloWorld 文本渲染
- ImageBase2D 图片2D渲染
- AssetsUtils 资源加载基础
- FrameEvent 帧事件管理
- BunnyMark-ImageBatchs 使用ImageBatchs+精灵图渲染好多的兔子（Tilemap）
- TextureAtlas 精灵图的基础使用
- BitmapFont 使用精灵图渲染位图字
- SpineRender 使用Spine骨骼动画渲染
- Mp3OggSound 音频的基础使用
- ContainerBox 基础容器使用
- BatchContainerBox 基础批处理容器使用
- BundleZip 使用Zip进行一次性加载资源
- XmlScene 使用自动构造宏+XML配置，创建界面（xml配置，可搭配ZIde进行构造）
- SaveData 本地储存数据的基础使用
- Particles GPU粒子渲染
- TouchImageBatch-TouchEvent Tilemap批处理容器点击事件处理
- CustomLoader 自定义加载器（加载JSON格式的精灵图）
- HotUpdateCode 热更新代码处理

# 发展
在`develop`目录下，包含了一些新的实现例子，为引擎促进性能。
- ZImage_v2 尝试使用Sprite渲染现在所有位图，不再使用Tilemap渲染方式，改进性能