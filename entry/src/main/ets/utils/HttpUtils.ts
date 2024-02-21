import http from '@ohos.net.http';

const CONNECT_TIMEOUT = 60
const READ_TIMEOUT = 60
const BASE_URL = 'https://www.baidu.com/'

class HttpUtils {

  private static instance: HttpUtils

  public static getInstance(): HttpUtils {
    if (!HttpUtils.instance) {
      HttpUtils.instance = new HttpUtils()
    }
    return HttpUtils.instance
  }

  httpRequest = http.createHttp()

  private constructor() {
    this.httpRequest.on('headerReceive', (header) => {
      //获取请求头信息
      //使用JSON.stringify(header)解析头信息
    })
  }

  getRequest(url: String) {
    this.requestReal(true, url, null)
  }

  postRequest(url: String, obj: Object) {
    this.requestReal(false, url, obj)
  }


  /**
   * 请求操作
   * @param isGet
   * @param url
   * @param obj
   * @returns
   */
  requestReal(isGet: Boolean, url: String, obj?: Object) {
    return new Promise((resolve, reject) => {
      let promise = this.httpRequest.request(BASE_URL + url + "", {
        method: isGet ? http.RequestMethod.GET : http.RequestMethod.POST,
        extraData: obj,
        connectTimeout: CONNECT_TIMEOUT * 1000,
        readTimeout: READ_TIMEOUT * 1000,
        header: {
          'Content-Type': 'application/json'
        }
      })
      promise.then((value) => {
        if (value.responseCode == http.ResponseCode.OK) {
          //成功
          //包含value.responseCode  value.Result  value.header  value.cookies
          resolve(value.result)
        } else {
          //失败
          reject(value.responseCode)
        }
      })
    })
  }
  //request  destroy   on  off
}

export default HttpUtils;