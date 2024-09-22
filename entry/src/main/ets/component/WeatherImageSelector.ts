const weatherIconDict: { [key: string]: string } = {
  晴: '100',
  多云: '101',
  少云: '102',
  晴间多云: '103',
  阴: '104',
  晴清: '150',
  晴间多云夜: '153',
  阴夜: '154',
  阵雨: '300',
  强阵雨: '301',
  雷阵雨: '302',
  强雷阵雨: '303',
  雷阵雨伴有冰雹: '304',
  小雨: '305',
  中雨: '306',
  大雨: '307',
  极端降雨: '308',
  毛毛雨: '309',
  暴雨: '310',
  大暴雨: '311',
  特大暴雨: '312',
  冻雨: '313',
  小到中雨: '314',
  中到大雨: '315',
  大到暴雨: '316',
  暴雨到大暴雨: '317',
  大暴雨到特大暴雨: '318',
  雨: '399',
  小雪: '400',
  中雪: '401',
  大雪: '402',
  暴雪: '403',
  雨夹雪: '404',
  雨雪天气: '405',
  阵雨夹雪: '406',
  阵雪: '407',
  小到中雪: '408',
  中到大雪: '409',
  大到暴雪: '410',
  雪: '499',
  薄雾: '500',
  雾: '501',
  霾: '502',
  扬沙: '503',
  浮尘: '504',
  沙尘暴: '507',
  强沙尘暴: '508',
  浓雾: '509',
  强浓雾: '510',
  中度霾: '511',
  重度霾: '512',
  严重霾: '513',
  大雾: '514',
  特强浓雾: '515',
  热: '900',
  冷: '901',
  未知: '999',
};

export function getIconPath(weather: string): string {
  const iconCode = weatherIconDict[weather];
  return '/color-256/' + (iconCode !== undefined ? iconCode : '999') + '.png';
};

const weatherBackgroundLabelDict: { [key: string]: string } = {
  // Sunny related
  晴: 'sunny',
  少云: 'sunny',
  晴间多云: 'sunny',
  晴清: 'sunny',
  晴间多云夜: 'sunny',

  // Cloudy
  多云: 'cloudy',
  阴: 'cloudy',
  阴夜: 'cloudy',

  // Rainy related
  阵雨: 'rainy',
  强阵雨: 'rainy',
  雷阵雨: 'rainy',
  强雷阵雨: 'rainy',
  雷阵雨伴有冰雹: 'rainy',
  小雨: 'rainy',
  中雨: 'rainy',
  大雨: 'rainy',
  极端降雨: 'rainy',
  毛毛雨: 'rainy',
  暴雨: 'rainy',
  大暴雨: 'rainy',
  特大暴雨: 'rainy',
  冻雨: 'rainy',
  小到中雨: 'rainy',
  中到大雨: 'rainy',
  大到暴雨: 'rainy',
  暴雨到大暴雨: 'rainy',
  大暴雨到特大暴雨: 'rainy',
  雨: 'rainy',
  雨夹雪: 'rainy',
  雨雪天气: 'rainy',

  // Snowy related
  小雪: 'snowy',
  中雪: 'snowy',
  大雪: 'snowy',
  暴雪: 'snowy',
  阵雨夹雪: 'snowy',
  阵雪: 'snowy',
  小到中雪: 'snowy',
  中到大雪: 'snowy',
  大到暴雪: 'snowy',
  雪: 'snowy',

  // Foggy related
  薄雾: 'foggy',
  雾: 'foggy',
  浓雾: 'foggy',
  强浓雾: 'foggy',
  大雾: 'foggy',
  特强浓雾: 'foggy',

  // Sandy related
  扬沙: 'sandy',
  浮尘: 'sandy',
  沙尘暴: 'sandy',
  强沙尘暴: 'sandy',

  // Haze related
  霾: 'foggy',
  中度霾: 'foggy',
  重度霾: 'foggy',
  严重霾: 'foggy',

  // Extreme temperatures
  热: 'sunny',
  冷: 'snowy',

  // Unknown
  未知: 'unknown',
};

export function getBackgroundPath(weather: string): string {
  const background = weatherBackgroundLabelDict[weather];
  return '/background/' + (background !== undefined ? background : 'unknown') + '.png';
};