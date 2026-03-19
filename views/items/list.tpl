<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>{{i18n .Lang "project.prj_space_list_of" .Model.ItemName}} - Powered by MinDoc</title>
    <meta name="keywords" content="MinDoc,文档在线管理系统,WIKI,wiki,wiki在线,文档在线管理,接口文档在线管理,接口文档管理,{{.Model.ItemName}}">
    <meta name="description" content="MinDoc文档在线管理系统 {{.site_description}}">
    <!-- Bootstrap -->
    <link href="{{cdncss "/static/bootstrap/css/bootstrap.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/font-awesome/css/font-awesome.min.css"}}" rel="stylesheet">

    <link href="{{cdncss "/static/css/main.css" "version"}}" rel="stylesheet">
    <link href="{{cdncss "/static/css/main-modern-ui.css" "version"}}" rel="stylesheet">
</head>
<body>
<div class="manual-reader manual-container manual-search-reader">
{{template "widgets/header.tpl" .}}

    <!-- Search Hero Section -->
    <div class="items-hero-section">
        <div class="container">
            <div class="search-hero-content">
                <h1 class="search-hero-title"><i class="fa fa-search"></i> {{i18n .Lang "project.search_title" .Model.ItemName}}</h1>
            </div>
        </div>
    </div>

    <div class="container manual-body">
        <div class="row" style="margin-top: -40px;">
            <div class="manual-list modern-grid">
            {{range $index,$item := .Lists}}
                <div class="list-item modern-card">
                    <div class="card-wrapper">
                        <div class="card-cover">
                            <a href="{{urlfor "DocumentController.Index" ":key" $item.Identify}}" title="{{$item.BookName}}-{{$item.CreateName}}">
                                <img src="{{cdnimg $item.Cover}}" class="cover-img" alt="{{$item.BookName}}-{{$item.CreateName}}" onerror="this.src='{{cdnimg "static/images/book.jpg"}}';">
                            </a>
                        </div>
                        <div class="card-content">
                            <a href="{{urlfor "DocumentController.Index" ":key" $item.Identify}}" class="card-title" title="{{$item.BookName}}-{{$item.CreateName}}">{{$item.BookName}}</a>
                            <div class="card-meta">
                                <i class="fa fa-user"></i>
                                <span>{{if eq $item.RealName "" }}{{$item.CreateName}}{{else}}{{$item.RealName}}{{end}}</span>
                            </div>
                        </div>
                    </div>
                </div>
            {{else}}
                <div class="empty-state">
                    <i class="fa fa-book-open empty-icon"></i>
                    <p class="empty-text">{{i18n .Lang "project.no_project"}}</p>
                </div>
            {{end}}

                <div class="clearfix"></div>
            </div>
            <nav class="pagination-container modern-pagination">
                {{if gt .TotalPages 1}}
                    {{.PageHtml}}
                {{end}}
                <div class="clearfix"></div>
            </nav>
        </div>
    </div>
{{template "widgets/footer.tpl" .}}
</div>
<script src="{{cdnjs "/static/jquery/1.12.4/jquery.min.js"}}"></script>
<script src="{{cdnjs "/static/bootstrap/js/bootstrap.min.js"}}"></script>
{{.Scripts}}
</body>
</html>