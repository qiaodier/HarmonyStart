import { IHttpListener } from './IHttpListener'


export interface IHttpRequest {

  setUrl(url: string): void;

  setParams(params: string): void;

  execute(): Promise<void>;

  setListener(listener: IHttpListener): void;
}