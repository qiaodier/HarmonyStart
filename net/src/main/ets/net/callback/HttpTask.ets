import { IHttpListener } from './IHttpListener';
import { IHttpRequest } from './IHttpRequest';


export class HttpTask<T> {
  private iHttpRequest: IHttpRequest
  private iHttpListener: IHttpListener

  constructor(url: string, requestData: T, iHttpRequest: IHttpRequest, iHttpListener: IHttpListener) {
    this.iHttpRequest = iHttpRequest;
    this.iHttpListener = iHttpListener;
    this.iHttpRequest.setUrl(url)
    this.iHttpRequest.setListener(this.iHttpListener)
    if (requestData != null) {
      let requestParams: string = JSON.stringify(requestData);
      this.iHttpRequest.setParams(requestParams);
    } else {
      this.iHttpListener.onFailure("request data is null.")
    }
  }

  async run(): Promise<void> {
    await this.iHttpRequest.execute()
  }
}