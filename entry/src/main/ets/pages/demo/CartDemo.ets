//商品类
class Goods {
  static id: number = 0
  name: string = `华为手机Mate X${Goods.id++}`
  isSelected: boolean = false
}


//公共卡片样式
@Styles function card() {
  .width('95%')
  .padding(20)
  .backgroundColor('#FFFFFF')
  .borderRadius(15)
}

//选中商品的文字样式   扩展Text组件样式
@Extend(Text) function selectedGoodsStyle(flag:boolean) {
    .fontColor(flag?Color.Red:Color.Black)
  .fontWeight(flag?FontWeight.Bold:FontWeight.Normal)
}


@Entry
@Component
struct CartDemo {
  //商品总数
  @Provide totalNum: number = 0
  //选中的数量
  @Provide selectedNum: number = 0
  //Provide Consume 保持变量名字一样即可
  build() {
    Column() {
      //购物车title、进度条
      CartTitle()
      //添加商品按钮  商品列表
      GoodsContent()
    }.width('100%')
    .height('100%')
    .backgroundColor('#F1F2F3')
  }
}


@Component
struct CartTitle {
  //商品总数
  @Consume totalNum: number
  //选中的数量
  @Consume selectedNum: number

  build() {
    Row() {
      Text('购物车:')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Stack() {
        Progress({ value: this.selectedNum, total: this.totalNum, type: ProgressType.Ring })
        Text(`${this.selectedNum}/${this.totalNum}`)
      }
    }.card()
    .justifyContent(FlexAlign.SpaceEvenly)
    .margin({ top: 20, bottom: 20 })
  }
}


@Component
struct GoodsContent {
  //商品列表
  @State goodsList: Goods[] = []
  //商品总数
  @Consume totalNum: number
  //选中的数量
  @Consume selectedNum: number

  onChangeGoods() {
    //更新商品总数
    this.totalNum = this.goodsList.length
    //更新选中的商品数
    this.selectedNum = this.goodsList.filter(item => item.isSelected).length
  }

  build() {
    Column(){
      //添加按钮
      Button('添加商品')
        .width(200)
        .onClick(() => {
          //添加商品
          this.goodsList.push(new Goods())
          this.onChangeGoods()
        })
      //商品列表
      List({ space: 10 }) {
        //循环渲染
        ForEach(this.goodsList, (item: Goods, index) => {
          ListItem() {
            Row() {
              Text(item.name)
                  // .selectedGoodsStyle(item.isSelected)
              Checkbox()
                .select(item.isSelected)
                .onChange(val => {
                  //修改选中状态
                  item.isSelected = val
                  this.onChangeGoods()
                })
            }.card()
            .justifyContent(FlexAlign.SpaceAround)
          }.swipeAction({ end: this.deleteButton(index) })
          // .onClick(()=>{
          //   item.isSelected = !item.isSelected
          //   this.onChangeGoods()
          // })
        })
      }.width("95%")
     .layoutWeight(1)
      .divider({ strokeWidth: 2, color: '#36D', startMargin: 10, endMargin: 10 })
      .alignListItem(ListItemAlign.Center)
    }
  }

  @Builder deleteButton(index: number) {
    Button() {
      Image($r('app.media.icon'))
        .width(20)
    }.width(40)
    .height(40)
    // .backgroundColor(Color.Red)
    .onClick(() => {
      //删除数组数据操作
      this.goodsList.splice(index, 1)
      this.onChangeGoods()
    })
  }
}


