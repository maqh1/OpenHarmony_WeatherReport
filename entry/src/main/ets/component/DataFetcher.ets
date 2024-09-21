import http from '@ohos.net.http';

export function GetData(url: string): Promise<object> {
  return new Promise((resolve, reject) => {
    let httpRequest = http.createHttp();

    console.log(`Making GET request to: ${url}`); // 打印请求的 URL

    httpRequest.request(
      url,
      {
        method: http.RequestMethod.GET,
        header: {
          'Content-Type': 'application/json'
        }
      },
      (err, data) => {
        if (!err) {
          try {
            console.log("Response received:", data.result); // 打印响应数据
            const jsonResponse: object = JSON.parse(data.result.toString()); // 解析并赋予类型为 object
            resolve(jsonResponse); // 返回解析后的 JSON 对象
          } catch (parseError) {
            console.error(`Failed to parse JSON: ${parseError}`); // 打印解析错误
            reject(`Failed to parse JSON: ${parseError}`);
          }
        } else {
          console.error(`Request failed: ${err}`); // 打印请求错误
          reject(`Request failed: ${err}`);
        }
      }
    );
  });
}
