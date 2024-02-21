import LogUtils from '../entryability/LogUtils'

@Entry
@Component
struct Login {
  @State message: string = 'Hello World'
  account: String = ""
  pwd: String = ""

  build() {
    Row() {
      Column() {
        Image($r('app.media.app_icon'))
          .width(78)
          .height(78)
        Text("登录界面")
          .fontSize(24)
          .fontWeight(FontWeight.Medium)
          .fontColor('#182431')
          .margin({ top: 5 })
        TextInput({ placeholder: '账号' })
          .maxLength(11)
          .type(InputType.PhoneNumber)
          .margin({ left: 20, right: 20, top: 50 })
          .onChange((value: String) => {
            LogUtils.logDebug("text input account onChange:" + value)
            this.account = value
          })
        TextInput({ placeholder: '密码' })
          .maxLength(12)
          .type(InputType.Password)
          .margin({ left: 20, right: 20, top: 10 })
          .onChange((value: String) => {
            LogUtils.logDebug("text input password onChange:" + value)
            this.pwd = value
          })
        Row() {
          Text("短信验证码登录")
            .fontSize(20)
            .fontWeight(FontWeight.Medium)
            .fontColor('#182431')
            .onClick(() => {
              LogUtils.logDebug("to verify code login:")
            })
          Text("忘记密码")
            .fontSize(20)
            .fontWeight(FontWeight.Medium)
            .fontColor('#182431')
            .onClick(() => {
              LogUtils.logDebug("to verify code login:")
            })
        }
        .width("90%")
        .margin({ left: 20, right: 20, top: 10 })
        .justifyContent(FlexAlign.SpaceBetween)

        Button('登录', { type: ButtonType.Capsule })
          .onClick(() => {
            LogUtils.logDebug("to login:")
          }).width("90%").margin({ top: 70 })
        Text("注册账号").fontSize(20).margin({ top: 10 })
        Column() {
          Text("其他登录方式")
        }.margin({ top: 50 })

        Row() {
          Text("方式一")
          Text("方式二")
          Text("方式三")
        }
        .width("90%")
        .justifyContent(FlexAlign.SpaceAround)
        .margin({ top: 20 })
      }
      .width('100%')
    }
    .height('100%')
    .alignItems(VerticalAlign.Center)
  }
}