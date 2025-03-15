@Entry
@Component
//登录页面，多设备屏幕适配方案
struct LoginPage {
  build() {
    GridRow(
      {
        //屏幕适配格栅 小4 中8 大12
        columns: { sm: 4, md: 8, lg: 12 },
        //栅格中间的空白宽度 12vp
        gutter: { x: '12vp' }
      }
    ) {
      GridCol(
        {
          //布局宽度占几个栅格
          span: { sm: 4, md: 6, lg: 8 },
          //布局从左开始的偏移量
          offset: { sm: 0, md: 1, lg: 2 }
        }
      ) {
        //内容

      }
    }
  }
}