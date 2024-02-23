import { IDataListener } from '../IDataListener';
import { IHttpListener } from '../IHttpListener';

export class JsonHttpListener<T> implements IHttpListener {
  private iDataListener: IDataListener<T>;

  constructor(iDataListener: IDataListener<T>) {
    this.iDataListener = iDataListener;
  }

  onFailure(error: string): void {
    this.iDataListener.onFailure(error)
  }

  onSuccess(success: string): void {
    let resultObj: T = JSON.parse(success);
    this.iDataListener.onSuccess(resultObj)
  }
}