@Entry
@Component
struct WebPage {
  @State message: string = 'Hello World'
  controller = new WebController();
  build() {
    Row() {
      Column() {
        Web({
          src:$rawfile('index.html'),//本地网页加载
          // src:'https://www.baidu.com',//远程网页加载
          controller:this.controller
        }).onConfirm((event)=>{
          //当加载的网页中调用了confirm方法，将会回调这里
          //event.url
          //event.message
          //event.result
          return true;
        })
        Button('执行js方法')
          .onClick(()=>{
            this.controller.runJavaScript({script:'test()'})
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}