import {IHttpListener} from './IHttpListener'
import {HttpTask} from './HttpTask'

export interface IHttpRequest{


  setRequest(url:string,
             method:string,
             params:string)

  setListener(listener:IHttpListener)

  execute()

}