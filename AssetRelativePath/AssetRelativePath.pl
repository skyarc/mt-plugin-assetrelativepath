package MT::Plugin::AssetRelativePath;
# AssetRelativePath - Make path to relative one of inserted assets.
#       Copyright (c) 2009 SKYARC System Co.,Ltd.
#       @see http://www.skyarc.co.jp/engineerblog/entry/assetrelativepath.html
#       @version 1.00
use base qw( MT::Plugin );
my $plugin = new MT::Plugin ({
	name => 'AssetRelativePath',
	version => '1.02',
	doc_link => 'http://www.skyarc.co.jp/engineerblog/entry/assetrelativepath.html',
	author_name => 'SKYARC System Co., Ltd,',
	author_link => 'http://www.skyarc.co.jp',
	description => '<MT_TRANS phrase="Insert an item with a relative path.">',
	l10n_class => 'AssetRelativePath::L10N',
	registry =>{
		callbacks => {
			'MT::App::CMS::template_param.asset_insert' => \&hdlr_asset_relative_url,
		},
	},
});
MT->add_plugin ($plugin);
sub hdlr_asset_relative_url {
   my ($eh, $app, $param, $tmpl) = @_;
   $param->{'upload_html'} =~ s!https?://[^/]+!!g;
   1;
}
1;