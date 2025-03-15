import { HttpTask } from './HttpTask';
import { IDataListener } from './IDataListener';
import { IHttpListener } from './IHttpListener';
import { IHttpRequest } from './IHttpRequest';
import { JsonHttpListener } from './json/JsonHttpListener';
import { JsonHttpRequest } from './json/JsonHttpRequest';


export class RequestStart {
  static sendRequest<T, M>(url: string, requestParams: T, iDataListener: IDataListener<M>) {
    let iHttpListener: IHttpListener = new JsonHttpListener<M>(iDataListener)
    let iHttpRequest: IHttpRequest = new JsonHttpRequest(url,JSON.stringify(requestParams),iHttpListener);
    let httpTask: HttpTask<T> = new HttpTask(url, requestParams, iHttpRequest, iHttpListener);
    httpTask.run()
  }
}