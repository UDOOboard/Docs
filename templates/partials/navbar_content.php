<a class="udoologo pull-left" href="<?= $params['base_page'] . $params['index']->getUri(); ?>">
		<img src="http://www.udoo.org/docs/img/logo_docs.png"> <span>Docs</span>
		<a class="btn btn-lg button_docs pull-right" href="http://www.udoo.org/docs-neo/">UDOO Neo Docs</a>
</a>

<?php if ($params['html']['search']) { ?>
    <div class="navbar-right navbar-form search">
        <i class="glyphicon glyphicon-search search__icon">&nbsp;</i>
        <input type="search" id="tipue_search_input" class="form-control search__field" placeholder="Search..." autocomplete="on" results=25 autosave=text_search>
    </div>
<?php } ?>
