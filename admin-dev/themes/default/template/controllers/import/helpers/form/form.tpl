{*
* 2007-2013 PrestaShop
**
* NOTICE OF LICENSE
**
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
**
* DISCLAIMER
**
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
**
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2013 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<div class="leadin">{block name="leadin"}{/block}</div>
{if $module_confirmation}
<div class="module_confirmation conf confirm">
	{l s='Your .CSV file has been sucessfully imported into your shop. Don\'t forget to Re-build the products search index.'}
</div>
{/if}
<div id="upload_file_import" style="display: none">
	<div>{l s='Only UTF-8 and ISO-8859-1 encoding are allowed'}</div>
	<form action="{$current}&token={$token}" method="post" enctype="multipart/form-data" class="form-horizontal">
		<div class="panel">
			<div class="form-group">
				<label class="control-label col-lg-3">{l s='Select your CSV file'}</label>
				<div class="col-lg-9">
					<div class="row">
						<div class="col-lg-7">
							<input id="file" type="file" name="file" class="hide" />
							<div class="dummyfile input-group">
								<span class="input-group-addon"><i class="icon-file"></i></span>
								<input id="file-name" type="text" class="disabled" name="filename" readonly />
								<span class="input-group-btn">
									<button id="file-selectbutton" type="button" name="submitAddAttachments" class="btn btn-default">
										<i class="icon-folder-open"></i> {l s='Choose a file'}
									</button>
								</span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-7">
							<p class="help-block">
								{l s='You can also upload your file via FTP to the following directory:'} {$path_import}.
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-9 col-lg-offset-3">
					<button type="submit" name="submitFileUpload" class="btn btn-default"><i class="icon-upload"></i> {l s='Upload'}</button>
				</div>
			</div>
		</div>
	</form>
</div>

{* Import fieldset *}
<form id="preview_import" action="{$current}&token={$token}" method="post" enctype="multipart/form-data" class="form-horizontal">
	
	<div class="panel">
		<h3>
			<i class="icon-upload"></i>
			{l s='Import'}
		</h3>
		<div class="form-group">
			<label class="control-label col-lg-3">
				{if count($files_to_import) > 1}
					{l s='Your CSV file (%d files):' sprintf=count($files_to_import)}
				{else}
					{l s='Your CSV file (%d file):' sprintf=count($files_to_import)}
				{/if}
			</label>
			<div class="col-lg-6">
				{if count($files_to_import)}
					<select name="csv">
						{foreach $files_to_import AS $filename}
							<option value="{$filename}"{if $csv_selected == $filename} selected="selected"{/if}>{$filename|escape:'html':'UTF-8'}</option>
						{/foreach}
					</select>
				{/if}
				<a href="#upload_file_import" id="upload_file_import_link" class="btn btn-default">
					<i class="icon-plus-sign-alt"></i>
					{l s='Upload'}
				</a>

			</div>
		</div>
		<div class="form-group">
			<div class="col-lg-6">
				<p class="panel">
					<a href="#" onclick="$('#sample_files_import').slideToggle(); return false;">
						{l s='Click to view our sample import csv files.'}
					</a>
				</p>
				<div id="sample_files_import" style="display:none" class="list-group">
					<a class="list-group-item" href="../docs/csv_import/categories_import.csv" target="_blank">
						<i class="icon-download"></i>
						{l s='Sample Categories file'}
					</a>
					<a class="list-group-item" href="../docs/csv_import/products_import.csv" target="_blank">
						<i class="icon-download"></i>
						{l s='Sample Products file'}
					</a>
					<a class="list-group-item" href="../docs/csv_import/combinations_import.csv" target="_blank">
						<i class="icon-download"></i>
						{l s='Sample Combinations file'}
					</a>
					<a class="list-group-item" href="../docs/csv_import/customers_import.csv" target="_blank">
						<i class="icon-download"></i>
						{l s='Sample Customers file'}
					</a>
					<a class="list-group-item" href="../docs/csv_import/addresses_import.csv" target="_blank">
						<i class="icon-download"></i>
						{l s='Sample Addresses file'}
					</a>
					<a class="list-group-item" href="../docs/csv_import/manufacturers_import.csv" target="_blank">
						<i class="icon-download"></i>
						{l s='Sample Manufacturers file'}
					</a>
					<a class="list-group-item" href="../docs/csv_import/suppliers_import.csv" target="_blank">
						<i class="icon-download"></i>
						{l s='Sample Suppliers file'}
					</a>
					<a class="list-group-item" href="../docs/csv_import/alias_import.csv" target="_blank">
						<i class="icon-download"></i>
						{l s='Sample Alias file'}
					</a>
					{if $PS_ADVANCED_STOCK_MANAGEMENT}
						<a class="list-group-item" href="../docs/csv_import/supply_orders_import.csv" target="_blank">
							<i class="icon-download"></i>
							{l s='Supply Orders sample file'}
						</a>
						<a class="list-group-item" href="../docs/csv_import/supply_orders_details_import.csv" target="_blank">
							<i class="icon-download"></i>
							{l s='Supply Orders Details sample file'}
						</a>
					{/if}
				</div>
			</div>
			<div class="col-lg-6">
				<p class="panel">
					<a href="#" onclick="$('#csv_files_import').slideToggle(); return false;">
						{l s='Click to view your csv files.'}
					</a>
				</p>

				<ul id="csv_files_import" style="display:none;" class="list-group">
					{foreach $files_to_import AS $filename}
					<li>
						<a href="{$current}&token={$token}&csvfilename={$filename|@base64_encode}">{$filename}</a>&nbsp;&nbsp;
						<a href="{$current}&token={$token}&csvfilename={$filename|@base64_encode}&delete=1" class="btn btn-default">
							<i class="icon-trash"></i> {l s='Delete'}
						</a>
					</li>
					{/foreach}
				</ul>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-lg-3">{l s='What kind of entity would you like to import?'} </label>
			<div class="col-lg-9">
				<select name="entity" id="entity">
					{foreach $entities AS $entity => $i}
						<option value="{$i}"{if $entity_selected == $i} selected="selected"{/if}>
							{$entity}
						</option>
					{/foreach}
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-lg-3">
				<span title="" data-toggle="tooltip" class="label-tooltip" data-original-title="{l s='The locale must be installed'}">
					{l s='Language of the file'}
				</span>
			</label>
			<div class="col-lg-9">
				<select name="iso_lang">
					{foreach $languages AS $lang}
						<option value="{$lang.iso_code}" {if $lang.id_lang == $id_language} selected="selected"{/if}>{$lang.name}</option>
					{/foreach}
				</select>
			</div>
		</div>			
		<div class="form-group">
			<label for="convert" class="control-label col-lg-3">{l s='ISO-8859-1 encoded file?'} </label>
			<div class="col-lg-9">
				<label class="switch-light prestashop-switch fixed-width-lg">
					<input name="convert" id="convert" type="checkbox" />
					<span>
						<span>{l s='Yes'}</span>
						<span>{l s='No'}</span>
					</span>
					<a class="slide-button btn btn-default"></a>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-lg-3">{l s='Field separator'} </label>
			<div class="col-lg-9">
				<input type="text" value="{if isset($separator_selected)}{$separator_selected|escape:'html':'UTF-8'}{else};{/if}" name="separator"/>
				<div class="help-block">{l s='e.g. '} 1; Ipod; 129.90; 5</div>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-lg-3">{l s='Multiple value separator'} </label>
			<div class="col-lg-9">
				<input type="text" value="{if isset($multiple_value_separator_selected)}{$multiple_value_separator_selected|escape:'html':'UTF-8'}{else},{/if}" name="multiple_value_separator"/>
				<div class="help-block">{l s='e.g. '} Ipod; red.jpg, blue.jpg, green.jpg; 129.90</div>
			</div>
		</div>
		<div class="form-group">
			<label for="truncate" class="control-label col-lg-3">{l s='Delete all'} <span id="entitie">{l s='categories'}</span> {l s='before import?'} </label>
			<div class="col-lg-9">
				<label class="switch-light prestashop-switch fixed-width-lg">
					<input name="truncate" id="truncate" type="checkbox"/>
					<span>
						<span>{l s='Yes'}</span>
						<span>{l s='No'}</span>
					</span>
					<a class="slide-button btn btn-default"></a>
				</label>
			</div>
		</div>
		<div class="form-group" style="display: none">
			<label for="match_ref" class="control-label col-lg-3">{l s='Use product reference as key?'}</label>
			<div class="col-lg-9">
				<label class="switch-light prestashop-switch fixed-width-lg">
					<input name="match_ref" id="match_ref" type="checkbox" />
					<span>
						<span>{l s='Yes'}</span>
						<span>{l s='No'}</span>
					</span>
					<a class="slide-button btn btn-default"></a>
				</label>
			</div>
		</div>
		<div class="form-group">
			<label for="regenerate" class="control-label col-lg-3">{l s='No thumbnails regeneration'}</label>
			<div class="col-lg-6">
				<input name="regenerate" id="regenerate" type="checkbox" />
			</div>
		</div>
		<div class="form-group">
			<label for="forceIDs" class="control-label col-lg-3">
				<span title="" data-toggle="tooltip" class="label-tooltip" data-original-title="{l s='If you don\'t use this option, all ID\'s will be auto-incremented.'}">
					{l s='Force all ID\'s during import?'} 
				</span>
			</label>
			<div class="col-lg-9">
				<label class="switch-light prestashop-switch fixed-width-lg">
					<input name="forceIDs" id="forceIDs" type="checkbox"/>
					<span>
						<span>{l s='Yes'}</span>
						<span>{l s='No'}</span>
					</span>
					<a class="slide-button btn btn-default"></a>
				</label>
			</div>
		</div>
		<div class="form-group">
			<div class="col-lg-6 col-lg-push-3">
				<button type="submit" name="submitImportFile" id="submitImportFile" class="btn btn-default" {if empty($files_to_import)}disabled{/if}>
					<i class="icon-circle-arrow-right"></i>
					{l s='Next step'}
				</button>
			</div>
		</div>

		{if empty($files_to_import)}
		<div class="alert alert-info">{l s='You must upload a file in order to proceed to the next step'}</div>
		{/if}

		<div class="alert alert-warning import_products_categories">
			<p>{l s='Note that the category import does not support categories of the same name.'}</p>
			<p>{l s='Note that you can have several products with the same reference.'}</p>
		</div>
		<div class="alert alert-warning import_supply_orders_details">
			<p>{l s='Importing Supply Order Details will reset products ordered, if there are any.'}</p>
		</div>
		{if !count($files_to_import)}
			<div class="alert alert-warning">
				<p>{l s='There is no CSV file available. Please upload one using the \'Upload\' button above.'}</p>
				<ul>
					<li>{l s='You can read information on CSV import at:'}
						<a href="http://doc.prestashop.com/display/PS16/CSV+Import+Parameters" target="_blank">http://doc.prestashop.com/display/PS16/CSV+Import+Parameters</a>
					</li>
					<li>{l s='Read more about CSV format at:'}
						<a href="http://en.wikipedia.org/wiki/Comma-separated_values" target="_blank">http://en.wikipedia.org/wiki/Comma-separated_values</a>
					</li>
				</ul>
			</div>
		{/if}
	</div>
</form>

<div class="panel">
	<h3>
		<i class="icon-download"></i>
		{l s='Available fields'}
	</h3>
	<div id="availableFields" class="alert alert-warning">
		{$available_fields}
	</div>
	<p>{l s='* Required field'}</p>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		var truncateAuthorized = {$truncateAuthorized|intval};
		activeClueTip();
		$("a#upload_file_import_link").fancybox({
				'titleShow' : false,
				'transitionIn' : 'elastic',
				'transitionOut' : 'elastic',
				'autoDimensions' : false,
				'autoSize'   : false,
				'width' : 700,
				'height' : 300
		});

		$('#preview_import').submit(function(e){
			if ($('#truncate').get(0).checked)
				if (truncateAuthorized)
				{
					if (!confirm('{l s='Are you sure that you would like to delete this' js=1}' + ' ' + $.trim($('#entity > option:selected').text().toLowerCase()) + '?'))
						e.preventDefault();
				}
				else
				{
					jAlert('{l s='You do not have permission to delete here. When the multistore is enabled, only a SuperAdmin can delete all items before an import.' js=1}');
					return false;
				}
		});

		$("select#entity").change(function(){
			if ($("#entity > option:selected").val() == 8 || $("#entity > option:selected").val() == 9)
				$("label[for=truncate],#truncate").hide();
			else
				$("label[for=truncate],#truncate").show();
	
			if ($("#entity > option:selected").val() == 9)
				$(".import_supply_orders_details").show();
			else
			{
				$(".import_supply_orders_details").hide();
				$('input[name=multiple_value_separator]').val('{if isset($multiple_value_separator_selected)}{$multiple_value_separator_selected}{else},{/if}');
			}
			if ($("#entity > option:selected").val() == 1)
				$("#match_ref").closest('.form-group.').show();
			else
				$("#match_ref").closest('.form-group.').hide();

			if ($("#entity > option:selected").val() == 1 || $("#entity > option:selected").val() == 0)
				$(".import_products_categories").show();
			else
				$(".import_products_categories").hide();

			if ($("#entity > option:selected").val() == 0 || $("#entity > option:selected").val() == 1 || 
				$("#entity > option:selected").val() == 5 || $("#entity > option:selected").val() == 6)
				$("#regenerate").closest('.form-group.').show();
			else
				$("#regenerate").closest('.form-group.').hide();

			if ($("#entity > option:selected").val() == 0 || $("#entity > option:selected").val() == 1 || $("#entity > option:selected").val() == 3 || $("#entity > option:selected").val() == 5 || $("#entity > option:selected").val() == 6 || $("#entity > option:selected").val() == 7)
				$("#forceIDs").closest('.form-group.').show();
			else
				$("#forceIDs").closest('.form-group.').hide();
			$("#entitie").html($("#entity > option:selected").text().toLowerCase());
			$.ajax({
				url: 'ajax.php',
				data: {
					getAvailableFields:1,
					entity: $("#entity").val()
				},
				dataType: 'json',
				success: function(j){
					var fields = "";
					$("#availableFields").empty();
					
					for (var i = 0; i < j.length; i++)
						fields += j[i].field;
	
					$("#availableFields").html(fields);
					activeClueTip();
				},
				error: function(j){}			
			});
		});
		$("select#entity").trigger('change');
		function activeClueTip()
		{
			$('.info_import').cluetip({
				splitTitle: '|',
			    showTitle: false
		 	});
		};	

		$('#file-selectbutton').click(function(e){
			$('#file').trigger('click');
		});
		$('#file-name').click(function(e){
			$('#file').trigger('click');
		});
		$('#file').change(function(e){
			var val = $(this).val();
			var file = val.split(/[\\/]/);
			$('#file-name').val(file[file.length-1]);
		});
	});
</script>
