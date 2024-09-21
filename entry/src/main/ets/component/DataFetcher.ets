import http from '@ohos.net.http';

export interface WeatherData {
  shidu: string;
  pm25: number;
  pm10: number;
  quality: string;
  wendu: string;
  ganmao: string;
  forecast: Forecast[];
}

export interface Forecast {
  date: string;
  high: string;
  low: string;
  ymd: string;
  week: string;
  sunrise: string;
  sunset: string;
  aqi: number;
  fx: string;
  fl: string;
  type: string;
  notice: string;
}

export interface CityInfo {
  city: string;
  citykey: string;
  parent: string;
  updateTime: string;
}

export interface ApiResponse {
  message: string;
  status: number;
  date: string;
  time: string;
  cityInfo: CityInfo;
  data: WeatherData;
}

export const defaultResponse:ApiResponse={
  message: '',
  status: 0,
  date: '',
  time: '',
  cityInfo: {
    city: '',
    citykey: '',
    parent: '',
    updateTime: ''
  },
  data: {
    shidu: '',
    pm25: 0,
    pm10: 0,
    quality: '',
    wendu: '',
    ganmao: '',
    forecast: []
  }
};

export function GetData(cityCode: string): Promise<ApiResponse> {
  return new Promise((resolve, reject) => {
    let url = 'http://t.weather.itboy.net/api/weather/city/'+cityCode;
    let httpRequest = http.createHttp();
    console.log(`Making GET request to: ${url}`);

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
            console.log("Response received:", data.result);
            const jsonResponse: ApiResponse = JSON.parse(data.result.toString());
            resolve(jsonResponse);
          } catch (parseError) {
            console.error(`Failed to parse JSON: ${parseError}`);
            reject(`Failed to parse JSON: ${parseError}`);
          }
        } else {
          console.error(`Request failed: ${err}`);
          reject(`Request failed: ${err}`);
        }
      }
    );
  });
}
