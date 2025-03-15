import LogUtils from '../../entryability/LogUtils'
import { CanvasBean } from './CanvasBean'


const data:Array<CanvasBean> = [
  new CanvasBean(10,'Java','rgb(112,212,124)'),
  new CanvasBean(20,'Kotlin','rgb(112,22,111)'),
  new CanvasBean(30,'VUE','rgb(112,120,124)'),
  new CanvasBean(40,'Harmony','rgb(11,22,124)'),
  new CanvasBean(50,'Python','rgb(66,77,120)')
]
/**
 * 自定义view 画扇形+根据手势旋转
 */
@Entry
@Component
struct CanvasDemo {

  @State message: string = 'Hello World'
  private setting:RenderingContextSettings = new RenderingContextSettings(true)
  private context:CanvasRenderingContext2D = new CanvasRenderingContext2D(this.setting)
  @State rotateAngle: number = 0 // 饼图的旋转角度
  private lastX: number = 0; // 上一个触摸点的X坐标
  private lastY: number = 0; // 上一个触摸点的Y坐标
  private centerX: number = 0; // 组件中心的X坐标
  private centerY: number = 0; // 组件中心的Y坐标
  private isTouching: boolean = false; // 标记是否正在触摸

  build() {
    Flex({ direction: FlexDirection.Column}){
      Canvas(this.context)
        .backgroundColor(Color.White)
        .rotate({angle:this.rotateAngle})
        .onReady(() => {
          this.drawPieChart()
        })
        .onAreaChange((oldValue, newValue) => {
        // 确保 globalPosition 和 width/height 是 number 类型
        const globalX: number = Number(newValue.globalPosition?.x || 0);
        const globalY: number = Number(newValue.globalPosition?.y || 0);
        const width: number = Number(newValue.width || 0);
        const height: number = Number(newValue.height || 0);

        this.centerX = globalX + width / 2;
        this.centerY = globalY + height / 2;
      }) .onTouch((event: TouchEvent) => {
        this.handleTouch(event);
      })

      Button('点击').onClick(() => {
        this.rotateAngle += 30
      })
    }
  }

  private handleTouch(event: TouchEvent) {
    if (!event.touches || event.touches.length === 0) return; // 确保有触摸点

    const touch = event.touches[0]; // 获取第一个触摸点
    const x: number = Number(touch.x || 0); // 确保 x 是 number
    const y: number = Number(touch.y || 0); // 确保 y 是 number

    switch (event.type) {
      case TouchType.Down:
        // 触摸开始
        this.isTouching = true;
        this.lastX = x;
        this.lastY = y;
        break;

      case TouchType.Move:
        if (this.isTouching && this.centerX !== 0 && this.centerY !== 0) {
          // 计算当前触摸点和上一个触摸点相对于中心的角度
          const lastAngle: number = Math.atan2(this.lastY - this.centerY, this.lastX - this.centerX);
          const currentAngle: number = Math.atan2(y - this.centerY, x - this.centerX);
          // 计算角度差（转换为度数）
          let angleDiff: number = (currentAngle - lastAngle) * 180 / Math.PI;
          // 修正角度差，避免跳跃
          if (angleDiff > 180) angleDiff -= 360;
          if (angleDiff < -180) angleDiff += 360;
          // 更新旋转角度
          this.rotateAngle += angleDiff;
          // 限制角度在0-360度范围内
          // this.rotateAngle = (this.rotateAngle + 360) % 360;
          // 更新上一个触摸点
          this.lastX = x;
          this.lastY = y;
        }
        break;

      case TouchType.Up:
      case TouchType.Cancel:
        // 触摸结束
        this.isTouching = false;
        break;
    }
  }



// 绘制饼图
  private drawPieChart() {
    let width = this.context.width
    let height = this.context.height
    let sum = data.reduce((pre,cur) => pre + cur.specific,0)
    // 检查sum是否为0
    if (sum === 0) {
      return;
    }
    // 清空Canvas
    // this.context.clearRect(-width / 2, -height / 2, width, height)
    // 设置坐标系
    this.context.translate(width / 2, height / 2)
    // 旋转Canvas
    // this.context.rotate(this.rotationAngle)
    let startAngle = 0 // 初始角度为0
    for (let i = 0; i < data.length; i++) {
      const element = data[i]
      let sweepAngle = element.specific / sum * 360
      LogUtils.logDebug('sweepAngle:' + sweepAngle + "")
      this.context.beginPath()
      this.context.moveTo(0, 0)
      this.context.arc(0, 0, 100, startAngle * Math.PI / 180, (startAngle + sweepAngle) * Math.PI / 180)
      this.context.closePath()
      this.context.fillStyle = element.subTitle
      this.context.fill()
      // 计算文本位置
      let centerAngle = (startAngle + sweepAngle / 2) * Math.PI / 180 // 扇形的中心角度
      let textX = Math.cos(centerAngle) * 120 // 文本的X坐标
      let textY = Math.sin(centerAngle) * 120 // 文本的Y坐标

      // 绘制文本
      this.context.save() // 保存Canvas状态
      this.context.translate(textX, textY) // 移动Canvas到文本位置
      this.context.rotate(centerAngle + Math.PI / 2) // 旋转Canvas使文本与扇形对齐
      this.context.font = '50px Arial'
      this.context.fillStyle = 'black' // 设置文本颜色
      this.context.fillText(element.title, 0, 0) // 绘制文本
      this.context.restore() // 恢复Canvas状态

      startAngle += sweepAngle
    }
  }
}