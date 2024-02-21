import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    this.logInfo("onCreate...")
    // hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy() {
    this.logInfo("onDestroy...")
    // hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    this.logInfo("onWindowStageCreate...")
    // Main window is created, set main page for this ability
    // hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    this.logInfo("onWindowStageDestroy...")
    // Main window is destroyed, release UI related resources
    // hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    this.logInfo("onForeground...")
    // Ability has brought to foreground
    // hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    this.logInfo("onBackground...")
    // Ability has back to background
    // hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }

  logInfo(content:String){
    hilog.error(0x0000,"application",content+"")
  }
}
