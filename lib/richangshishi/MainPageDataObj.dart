import 'dart:convert' show json;

class MainPageDataObj {

  String data_type;
  String status;
  String status_txt;
  String time;
  String time_taken;
  List<dynamic> links;
  List<ResultBean> results;

  MainPageDataObj.fromParams({this.data_type, this.status, this.status_txt, this.time, this.time_taken, this.links, this.results});

  factory MainPageDataObj(jsonStr) => jsonStr == null ? null : jsonStr is String ? new MainPageDataObj.fromJson(json.decode(jsonStr)) : new MainPageDataObj.fromJson(jsonStr);

  MainPageDataObj.fromJson(jsonRes) {
    data_type = jsonRes['data_type'];
    status = jsonRes['status'];
    status_txt = jsonRes['status_txt'];
    time = jsonRes['time'];
    time_taken = jsonRes['time_taken'];
    links = jsonRes['links'] == null ? null : [];

    for (var linksItem in links == null ? [] : jsonRes['links']){
      links.add(linksItem);
    }

    results = jsonRes['results'] == null ? null : [];

    for (var resultsItem in results == null ? [] : jsonRes['results']){
      results.add(resultsItem == null ? null : new ResultBean.fromJson(resultsItem));
    }
  }

  @override
  String toString() {
    return '{"data_type": ${data_type != null?'${json.encode(data_type)}':'null'},"status": ${status != null?'${json.encode(status)}':'null'},"status_txt": ${status_txt != null?'${json.encode(status_txt)}':'null'},"time": ${time != null?'${json.encode(time)}':'null'},"time_taken": ${time_taken != null?'${json.encode(time_taken)}':'null'},"links": $links,"results": $results}';
  }
}

class ResultBean {

  String id;
  String imageId;
  String modifiedAt;
  String title;
  String type;
  List<ColumnBean> columns;


  ResultBean.fromParams({this.id, this.imageId, this.modifiedAt, this.title, this.type, this.columns});

  ResultBean.fromJson(jsonRes) {
    id = jsonRes['id'];
    imageId = jsonRes['imageId'];
    modifiedAt = jsonRes['modifiedAt'];
    title = jsonRes['title'];
    type = jsonRes['type'];
    columns = jsonRes['columns'] == null ? null : [];

    for (var columnsItem in columns == null ? [] : jsonRes['columns']){
      columns.add(columnsItem == null ? null : new ColumnBean.fromJson(columnsItem));
    }

  }

  @override
  String toString() {
    return '{"id": ${id != null?'${json.encode(id)}':'null'},"imageId": ${imageId != null?'${json.encode(imageId)}':'null'},"modifiedAt": ${modifiedAt != null?'${json.encode(modifiedAt)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"type": ${type != null?'${json.encode(type)}':'null'},"columns": $columns}';
  }
}

class ColumnBean {

  String backgroundColor;
  String backgroundId;
  String backgroundUrl;
  String columnType;
  String contentUrl;
  String endTime;
  String id;
  String moreColor;
  String moreText;
  String referenceId;
  String shows;
  String startTime;
  String subtitle;
  String subtitleColor;
  String template;
  String title;
  String titleColor;
  String type;
  List<RowBean> rows;
  GStyleBean gStyle;

  ColumnBean.fromParams({this.backgroundColor, this.backgroundId, this.backgroundUrl, this.columnType, this.contentUrl, this.endTime, this.id, this.moreColor, this.moreText, this.referenceId, this.shows, this.startTime, this.subtitle, this.subtitleColor, this.template, this.title, this.titleColor, this.type, this.rows, this.gStyle});

  ColumnBean.fromJson(jsonRes) {
    backgroundColor = jsonRes['backgroundColor'];
    backgroundId = jsonRes['backgroundId'];
    backgroundUrl = jsonRes['backgroundUrl'];
    columnType = jsonRes['columnType'];
    contentUrl = jsonRes['contentUrl'];
    endTime = jsonRes['endTime'];
    id = jsonRes['id'];
    moreColor = jsonRes['moreColor'];
    moreText = jsonRes['moreText'];
    referenceId = jsonRes['referenceId'];
    shows = jsonRes['shows'];
    startTime = jsonRes['startTime'];
    subtitle = jsonRes['subtitle'];
    subtitleColor = jsonRes['subtitleColor'];
    template = jsonRes['template'];
    title = jsonRes['title'];
    titleColor = jsonRes['titleColor'];
    type = jsonRes['type'];
    rows = jsonRes['rows'] == null ? null : [];

    for (var rowsItem in rows == null ? [] : jsonRes['rows']){
      rows.add(rowsItem == null ? null : new RowBean.fromJson(rowsItem));
    }

    gStyle = jsonRes['gStyle'] == null ? null : new GStyleBean.fromJson(jsonRes['gStyle']);
  }

  @override
  String toString() {
    return '{"backgroundColor": ${backgroundColor != null?'${json.encode(backgroundColor)}':'null'},"backgroundId": ${backgroundId != null?'${json.encode(backgroundId)}':'null'},"backgroundUrl": ${backgroundUrl != null?'${json.encode(backgroundUrl)}':'null'},"columnType": ${columnType != null?'${json.encode(columnType)}':'null'},"contentUrl": ${contentUrl != null?'${json.encode(contentUrl)}':'null'},"endTime": ${endTime != null?'${json.encode(endTime)}':'null'},"id": ${id != null?'${json.encode(id)}':'null'},"moreColor": ${moreColor != null?'${json.encode(moreColor)}':'null'},"moreText": ${moreText != null?'${json.encode(moreText)}':'null'},"referenceId": ${referenceId != null?'${json.encode(referenceId)}':'null'},"shows": ${shows != null?'${json.encode(shows)}':'null'},"startTime": ${startTime != null?'${json.encode(startTime)}':'null'},"subtitle": ${subtitle != null?'${json.encode(subtitle)}':'null'},"subtitleColor": ${subtitleColor != null?'${json.encode(subtitleColor)}':'null'},"template": ${template != null?'${json.encode(template)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"titleColor": ${titleColor != null?'${json.encode(titleColor)}':'null'},"type": ${type != null?'${json.encode(type)}':'null'},"rows": $rows,"gStyle": $gStyle}';
  }
}

class GStyleBean {

  String picStyle;
  String show;

  GStyleBean.fromParams({this.picStyle, this.show});

  GStyleBean.fromJson(jsonRes) {
    picStyle = jsonRes['picStyle'];
    show = jsonRes['show'];
  }

  @override
  String toString() {
    return '{"picStyle": ${picStyle != null?'${json.encode(picStyle)}':'null'},"show": ${show != null?'${json.encode(show)}':'null'}}';
  }
}

class RowBean {

  String clickType;
  String clickUrl;
  String push;

  RowBean.fromParams({this.clickType, this.clickUrl, this.push});

  RowBean.fromJson(jsonRes) {
    clickType = jsonRes['clickType'];
    clickUrl = jsonRes['clickUrl'];
    push = jsonRes['push'];
  }

  @override
  String toString() {
    return '{"clickType": ${clickType != null?'${json.encode(clickType)}':'null'},"clickUrl": ${clickUrl != null?'${json.encode(clickUrl)}':'null'},"push": ${push != null?'${json.encode(push)}':'null'}}';
  }
}

