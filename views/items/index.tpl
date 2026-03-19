<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>{{i18n .Lang "project.prj_space_list"}} - Powered by MinDoc</title>
    <meta name="keywords" content="MinDoc,文档在线管理系统,WIKI,wiki,wiki在线,文档在线管理,接口文档在线管理,接口文档管理">
    <meta name="description" content="MinDoc文档在线管理系统 {{.site_description}}">
    <meta name="author" content="Minho" />
    <meta name="site" content="https://www.iminho.me" />
    <!-- Bootstrap -->
    <link href="{{cdncss "/static/bootstrap/css/bootstrap.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/font-awesome/css/font-awesome.min.css"}}" rel="stylesheet">

    <link href="{{cdncss "/static/css/main.css" "version"}}" rel="stylesheet">
    <link href="{{cdncss "/static/css/main-modern-ui.css" "version"}}" rel="stylesheet">

</head>
<body>
<div class="manual-reader manual-container manual-search-reader">
{{template "widgets/header.tpl" .}}

    <div class="container manual-body">
        <div class="row">
            <div class="tag-container-outer modern-items-container" style="border: 0;margin-top: 0;padding: 5px 15px;min-height: 200px;">
                <div class="attach-list modern-items-grid" id="ItemsetsList">
                {{range $index,$item := .Lists}}
                    <a href="{{urlfor "ItemsetsController.List" ":key" $item.ItemKey}}" class="modern-items-card" title="{{$item.ItemName}}">
                        <div class="items-card-icon">
                            <i class="fa fa-folder"></i>
                        </div>
                        <div class="items-card-header">{{$item.ItemName}}</div>
                        <div class="items-card-description">
                            <span class="items-meta">
                                <i class="fa fa-book"></i>
                                {{i18n $.Lang "project.prj_amount"}}：{{$item.BookNumber}}
                            </span>
                            <span class="items-meta">
                                <i class="fa fa-user"></i>
                                {{i18n $.Lang "project.creator"}}：{{$item.CreateName}}
                            </span>
                            <span class="items-meta">
                                <i class="fa fa-calendar"></i>
                                {{i18n $.Lang "project.create_time"}}：{{$item.CreateTimeString}}
                            </span>
                        </div>
                    </a>
                {{else}}
                    <div class="items-empty-state">
                        <i class="fa fa-folder-open-o empty-icon"></i>
                        <p class="empty-text">{{i18n .Lang "project.no_projct_space"}}</p>
                    </div>
                {{end}}
                </div>
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
<script src="{{cdnjs "/static/jquery/1.12.4/jquery.min.js"}}" type="text/javascript"></script>
<script src="{{cdnjs "/static/bootstrap/js/bootstrap.min.js"}}" type="text/javascript"></script>
{{.Scripts}}
</body>
</html>