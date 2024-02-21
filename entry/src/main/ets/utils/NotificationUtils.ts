
import notificationManager from '@ohos.notificationManager';


class NotificationUtils{

  publishNotification(req:NotificationReq){
    let notificationReq:notificationManager.NotificationRequest={
      id:req.id?0:req.id,
      slotType:notificationManager.SlotType.SOCIAL_COMMUNICATION,//通知通道类型
      groupName:"test",//分组 合并
      showDeliveryTime:true,
      deliveryTime:new Date().getTime(),
      content:{
        contentType:req.type,
        normal:{
          title:req.title+"",
          text:req.content,
          additionalText:req.additionalText
        }
      },
      // smallIcon:,
      // largeIcon:,
      // actionButtons:[ //最多三个
      //   {
      //     title:'回复',
      //     wantAgent:
      //   }
      // ]
    }
    notificationManager.publish(notificationReq).then(()=>{
      //发送通知成功
    }).catch((err)=>{
      //发送通知失败
    })
  }
}



class  NotificationReq{
  id: number;
  type:notificationManager.ContentType;
  title:string;
  content:string;
  additionalText:string

  constructor(id:number,type:notificationManager.ContentType,title:string,content:string,additionalText:string) {
    this.id = id;
    this.type = type;
    this.title = title;
    this.content = content;
    this.additionalText = additionalText;
  }


}