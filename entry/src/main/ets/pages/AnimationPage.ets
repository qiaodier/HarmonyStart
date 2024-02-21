import lottie from '@ohos/lottie'


@Entry
@Component
struct AnimationPage {
  @State message: string = 'Hello World'

  private renderingSettings:RenderingContextSettings = new RenderingContextSettings(true);
  private renderingContext:CanvasRenderingContext2D = new CanvasRenderingContext2D(this.renderingSettings);

  animateItem = lottie.loadAnimation({
    container:this.renderingContext,
    renderer:'canvas',
    loop:-1,
    autoplay:true,
    path:'common/lottie/data.json'
  })

  onPageShow(){
    lottie.play()
  }

  onPageHide(){
    lottie.stop()
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .animation({
            duration:3000,//动画时长
            tempo:3.0,//速度
            delay:100,//播放延时
            curve:Curve.Linear,//动画变换曲线
            playMode:PlayMode.Reverse,//动画播放模式
            iterations:-1//播放次数
          })
        Canvas(this.renderingContext).backgroundImage($r('app.media.icon'))
      }
      .width('100%')
    }
    .height('100%')
  }


/**
 * 自定义动画
 * @param iconItem
 */
  @Builder AttrAnimIcons(iconItem:IconItem){
    Image(iconItem.imgRes)
      .width(60)
      .position({x:10})
      .objectFit(ImageFit.Contain)
      .animation({
        duration:2000,//动画时长
        tempo:3.0,//速度
        delay:200,//播放延时
        curve:Curve.Linear,//动画变换曲线
        playMode:PlayMode.Reverse,//动画播放模式
        iterations:-1//播放次数
      })

  }
}



export default class IconItem{
  imgRes?:Resource;
  others?:Resource;

  constructor(imgRes?:Resource,others?:Resource) {

    this.imgRes = imgRes;
    this.others = others;
  }
}
