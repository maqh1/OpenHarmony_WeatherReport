import { GetData, ApiResponse, Forecast, CityInfo, WeatherData } from '../component/DataFetcher';
import {getBackgroundPath} from '../component/WeatherImageSelector'
@Component
export struct Background {
  @Link response: ApiResponse;
  build() {
    if(this.response.data.forecast[0]) {
      Image(getBackgroundPath(this.response.data.forecast[0].type)).width('100%').height('100%');
    }
  }
}