<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="author" content="Minho" />
    <link rel="shortcut icon" href="{{cdnimg "/static/favicon.ico"}}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="renderer" content="webkit" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> {{if eq 200 .ErrorCode}}{{i18n .Lang "message.tips"}}{{else if eq 404 .ErrorCode}}{{i18n .Lang "message.page_not_existed"}}{{else}}{{i18n .Lang "message.system_error"}}{{end}} - Powered by MinDoc</title>
    <link href="{{cdncss "/static/bootstrap/css/bootstrap.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/font-awesome/css/font-awesome.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/css/main.css" "version"}}" rel="stylesheet">
    <link href="{{cdncss "/static/css/main-modern-ui.css" "version"}}" rel="stylesheet">
</head>
<body>
<div class="error-page-wrapper" style="background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);">
    <header class="error-page-header">
        <div class="container">
            <a href="{{.BaseUrl}}" class="error-brand">
                <i class="fa fa-book"></i>
                {{.SITE_NAME}}
            </a>
        </div>
    </header>
    <div class="error-page-container">
        <div class="error-page-content">
            {{if .ErrorMessage}}
                {{if .ErrorCode}}
                    <div class="error-code">{{.ErrorCode}}</div>
                    <h1 class="error-title">{{.ErrorMessage}}</h1>
                {{else}}
                    <div class="error-code">500</div>
                    <h1 class="error-title">{{i18n .Lang "message.system_error"}}</h1>
                    <p class="error-description">{{.ErrorMessage}}</p>
                {{end}}
            {{else}}
                <div class="error-code">500</div>
                <h1 class="error-title">{{i18n .Lang "message.system_error"}}</h1>
                <p class="error-description"></p>
            {{end}}
            <div class="error-actions">
                <a href="{{.BaseUrl}}" class="error-btn error-btn-primary">
                    <i class="fa fa-home"></i>
                    {{i18n .Lang "common.home"}}
                </a>
                <a href="javascript:history.back()" class="error-btn error-btn-secondary">
                    <i class="fa fa-arrow-left"></i>
                    {{i18n .Lang "common.back"}}
                </a>
            </div>
        </div>
    </div>
    <footer class="error-page-footer">
        <p class="error-footer-text">{{i18n .Lang "doc.doc_publish_by"}} <a href="https://www.iminho.me" target="_blank">MinDoc</a></p>
    </footer>
</div>
</body>
</html>
