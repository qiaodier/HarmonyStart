import reminderAgent from '@ohos.reminderAgent';
import contact from '@ohos.contact';


export default class ReminderService {
  public addReminder(alarmItem: ReminderItem, callback?: (reminderId: number) => void) {
    let reminder = this.initReminder(alarmItem);
    reminderAgent.publishReminder(reminder, (err, reminderId) => {
      if (callback != null) {
        callback(reminderId)
      }
    })
  }

  public deleteReminder(reminderId:number){
    reminderAgent.cancelReminder(reminderId);
  }

  private initReminder(item: ReminderItem): reminderAgent.ReminderRequestAlarm {
    return {
      reminderType: item.remindType,
      hour: item.hour,
      minute: item.minute,
      daysOfWeek: item.daysOfWeek,
      title: item.title,
      ringDuration: item.duration,
      snoozeTimes: item.intervalTimes,
      timeInterval: item.intervalMinute,
      actionButton: [
        {
          title: "关闭",
          type: reminderAgent.ActionButtonType.ACTION_BUTTON_TYPE_CLOSE
        },
        {
          title: "稍后提醒",
          type: reminderAgent.ActionButtonType.ACTION_BUTTON_TYPE_SNOOZE
        }
      ],
      wantAgent: {
        pkgName: globalThis.bundleName,
        abilityName: globalThis.abilityName
      },
      notificationId: item.notificationId
    }
  }
}

class ReminderItem {
  remindType: reminderAgent.ReminderType;
  hour: number;
  minute: number;
  daysOfWeek: Array<number>;
  title: string;
  duration: number;
  intervalTimes: number;
  intervalMinute: number;
  notificationId: number;

  constructor(remindType: reminderAgent.ReminderType,
              hour: number,
              minute: number,
              daysOfWeek: Array<number>,
              title: string,
              duration: number,
              intervalTimes: number,
              intervalMinute: number,
              notificationId: number) {
    this.remindType = remindType;
    this.hour = hour;
    this.minute = minute;
    this.daysOfWeek = daysOfWeek;
    this.title = title;
    this.duration = duration;
    this.intervalTimes = intervalTimes;
    this.intervalMinute = intervalMinute;
    this.notificationId = notificationId;
  }
}