
import { IHttpListener } from './IHttpListener';
import { IHttpRequest } from './IHttpRequest';

export class HttpTask implements IHttpRequest{

  private listener: IHttpListener
  private url:string
  private method:string
  private params:string

  execute() {

  }

  setListener(listener: IHttpListener) {
    this.listener = listener
  }

  setRequest(url:string, method:string, params:string) {


  }

}