/*
  --- menu items --- 
  note that this structure has changed its format since previous version.
  additional third parameter is added for item scope settings.
  Now this structure is compatible with Tigra Menu GOLD.
  Format description can be found in product documentation.
*/

function call_empty() {
	return false;
}

//Get cookie routine by Shelley Powers 
function get_cookie(Name) {
  var search = Name + "="
  var returnvalue = "";
  if (document.cookie.length > 0) {
    offset = document.cookie.indexOf(search)
    // if cookie exists
    if (offset != -1) { 
      offset += search.length
      // set index of beginning of value
      end = document.cookie.indexOf(";", offset);
      // set index of end of cookie value
      if (end == -1) end = document.cookie.length;
      returnvalue=unescape(document.cookie.substring(offset, end))
      }
   }
  return returnvalue;
}

function set_field(v,field,action) {
	// alert(escape('&'));
	//x = this.form.name.value;
	//alert(field+'_value');
	//alert(document.forms[1].name.value);
	//alert(get_cookie(this.call_action));
	document.getElementById(field+'_value').innerHTML = v;
	//document.getElementById('definition['+field+']').value = v;
	document.getElementById(field).value = v;
	new Effect.Highlight(field+'_value');

	if (action != null) {
		new Ajax.Updater(
			{
				success: field+'_value',
				failure: null
			},
			action,
			Object.extend({
				postBody:"value="+v.replace(/&/,'%26')+"&def_id="+get_cookie('doc_id')
			})
		);
	}
	/*if (field != 'major_dialect' && field != 'specific_dialect')  {
		document.forms[1].name.value = v;
	} else {
		if (field == 'major_dialect') {
			document.forms[1].major_dialect.value = v;
			document.forms[1].specific_dialect.value = ""
		} else
			document.forms[1].specific_dialect.value = v;
	}*/
		
};

function show_old_menu(m,coords) {
	//alert(m);
	cy = coords[1];
	cx = coords[0]
	y=m.a_border[0].e_oelement.style.top.substring(0,m.a_border[0].e_oelement.style.top.indexOf('p'))*1
	x=m.a_border[0].e_oelement.style.left.substring(0,m.a_border[0].e_oelement.style.left.indexOf('p'))*1
	delta_y = cy - y;
	delta_x = cx - x - 120; 
	
	alert(y);
	//alert(delta_y);
	
	for (var n_order = 0; n_order < m.a_border.length; n_order++) {
		//alert(m.a_border[n_order].e_oelement);
		y=m.a_border[n_order].e_oelement.style.top.substring(0,m.a_border[n_order].e_oelement.style.top.indexOf('p'))*1
		x=m.a_border[n_order].e_oelement.style.left.substring(0,m.a_border[n_order].e_oelement.style.left.indexOf('p'))*1
		
		m.a_border[n_order].e_oelement.style.top = y + delta_y; //coords[1];
		m.a_border[n_order].e_oelement.style.left = x + delta_x; //coords[0];
	}
	for (var n_order = 0; n_order < m.a_children.length; n_order++) {
		//alert(m.a_border[n_order].e_oelement.style.top);
		y=m.a_children[n_order].e_oelement.style.top.substring(0,m.a_children[n_order].e_oelement.style.top.indexOf('p'))*1
		x=m.a_children[n_order].e_oelement.style.left.substring(0,m.a_children[n_order].e_oelement.style.left.indexOf('p'))*1
		m.a_children[n_order].e_oelement.style.top = y + delta_y; //coords[1]+24;
		m.a_children[n_order].e_oelement.style.left = x + delta_x; //coords[0];
		if (m.a_children[n_order].a_children != null )
		for (var n2_order = 0; n2_order < m.a_children[n_order].a_children.length; n2_order++) {
		y2=m.a_children[n_order].a_children[n2_order].e_oelement.style.top.substring(0,m.a_children[n_order].a_children[n2_order].e_oelement.style.top.indexOf('p'))*1
			x2=m.a_children[n_order].a_children[n2_order].e_oelement.style.left.substring(0,m.a_children[n_order].a_children[n2_order].e_oelement.style.left.indexOf('p'))*1
			m.a_children[n_order].a_children[n2_order].e_oelement.style.top = y2 + delta_y; //coords[1]+y;
			m.a_children[n_order].a_children[n2_order].e_oelement.style.left = x2 + delta_x; //coords[0];
			if (m.a_children[n_order].a_children[n2_order].a_children != null) {
				for (var n3_order = 0; n3_order < m.a_children[n_order].a_children[n2_order].a_children.length; n3_order++) {
				y3=m.a_children[n_order].a_children[n2_order].a_children[n3_order].e_oelement.style.top.substring(0,m.a_children[n_order].a_children[n2_order].a_children[n3_order].e_oelement.style.top.indexOf('p'))*1
					x3=m.a_children[n_order].a_children[n2_order].a_children[n3_order].e_oelement.style.left.substring(0,m.a_children[n_order].a_children[n2_order].a_children[n3_order].e_oelement.style.left.indexOf('p'))*1
					m.a_children[n_order].a_children[n2_order].a_children[n3_order].e_oelement.style.top = y3 + delta_y; //coords[1]+y;
					m.a_children[n_order].a_children[n2_order].a_children[n3_order].e_oelement.style.left = x3 + delta_x; //coords[0];
					
					if (m.a_children[n_order].a_children[n2_order].a_children[n3_order].a_children != null) {
						for (var n4_order = 0; n4_order < m.a_children[n_order].a_children[n2_order].a_children[n3_order].a_children.length; n4_order++) {
						y4=m.a_children[n_order].a_children[n2_order].a_children[n3_order].a_children[n4_order].e_oelement.style.top.substring(0,m.a_children[n_order].a_children[n2_order].a_children[n3_order].a_children[n4_order].e_oelement.style.top.indexOf('p'))*1
							x4=m.a_children[n_order].a_children[n2_order].a_children[n3_order].a_children[n4_order].e_oelement.style.left.substring(0,m.a_children[n_order].a_children[n2_order].a_children[n3_order].a_children[n4_order].e_oelement.style.left.indexOf('p'))*1
							m.a_children[n_order].a_children[n2_order].a_children[n3_order].a_children[n4_order].e_oelement.style.top = y4 + delta_y; //coords[1]+y;
							m.a_children[n_order].a_children[n2_order].a_children[n3_order].a_children[n4_order].e_oelement.style.left = x4 + delta_x; //coords[0];
						}
					}
					
				}
			}

		}

	}
	
	if (document.forms[1] != null)
		document.forms[1].style.background = '#dddddd';
	//alert(m);
	for (var n_order = 0; n_order < m.a_border.length; n_order++) {
		//alert(m.a_border[n_order].e_oelement);
		m.a_border[n_order].e_oelement.style.visibility = 'visible';
	}
	for (var n_order = 0; n_order < m.a_children.length; n_order++) {
		//alert('set');
		m.a_children[n_order].e_oelement.style.visibility = 'visible';
	}
	//this.m.visibility = 'hidden';
	//new menu (MENU_ITEMS, MENU_POS);

/*	y=n.a_border[0].e_oelement.style.top.substring(0,n.a_border[0].e_oelement.style.top.indexOf('p'))*1
	x=n.a_border[0].e_oelement.style.left.substring(0,n.a_border[0].e_oelement.style.left.indexOf('p'))*1
	delta_y = coords[1] - y;
	delta_x = coords[0] - x - 120; 
	
	//alert(delta_y);
	
	for (var n_order = 0; n_order < n.a_border.length; n_order++) {
		//alert(n.a_border[n_order].e_oelement);
		y=n.a_border[n_order].e_oelement.style.top.substring(0,n.a_border[n_order].e_oelement.style.top.indexOf('p'))*1
		x=n.a_border[n_order].e_oelement.style.left.substring(0,n.a_border[n_order].e_oelement.style.left.indexOf('p'))*1
		
		n.a_border[n_order].e_oelement.style.top = y + delta_y; //coords[1];
		n.a_border[n_order].e_oelement.style.left = x + delta_x; //coords[0];
	}
	for (var n_order = 0; n_order < n.a_children.length; n_order++) {
		//alert(n.a_border[n_order].e_oelement.style.top);
		y=n.a_children[n_order].e_oelement.style.top.substring(0,n.a_children[n_order].e_oelement.style.top.indexOf('p'))*1
		x=n.a_children[n_order].e_oelement.style.left.substring(0,n.a_children[n_order].e_oelement.style.left.indexOf('p'))*1
		n.a_children[n_order].e_oelement.style.top = y + delta_y; //coords[1]+24;
		n.a_children[n_order].e_oelement.style.left = x + delta_x; //coords[0];
		if (n.a_children[n_order].a_children != null )
		for (var n2_order = 0; n2_order < n.a_children[n_order].a_children.length; n2_order++) {
		y2=n.a_children[n_order].a_children[n2_order].e_oelement.style.top.substring(0,n.a_children[n_order].a_children[n2_order].e_oelement.style.top.indexOf('p'))*1
			x2=n.a_children[n_order].a_children[n2_order].e_oelement.style.left.substring(0,n.a_children[n_order].a_children[n2_order].e_oelement.style.left.indexOf('p'))*1
			n.a_children[n_order].a_children[n2_order].e_oelement.style.top = y2 + delta_y; //coords[1]+y;
			n.a_children[n_order].a_children[n2_order].e_oelement.style.left = x2 + delta_x; //coords[0];
			if (n.a_children[n_order].a_children[n2_order].a_children != null) {
				for (var n3_order = 0; n3_order < n.a_children[n_order].a_children[n2_order].a_children.length; n3_order++) {
				y3=n.a_children[n_order].a_children[n2_order].a_children[n3_order].e_oelement.style.top.substring(0,n.a_children[n_order].a_children[n2_order].a_children[n3_order].e_oelement.style.top.indexOf('p'))*1
					x3=n.a_children[n_order].a_children[n2_order].a_children[n3_order].e_oelement.style.left.substring(0,n.a_children[n_order].a_children[n2_order].a_children[n3_order].e_oelement.style.left.indexOf('p'))*1
					n.a_children[n_order].a_children[n2_order].a_children[n3_order].e_oelement.style.top = y3 + delta_y; //coords[1]+y;
					n.a_children[n_order].a_children[n2_order].a_children[n3_order].e_oelement.style.left = x3 + delta_x; //coords[0];
				}
			}

		}

	}
	
	
	document.forms[1].style.background = '#dddddd';
	//alert(m);
	for (var n_order = 0; n_order < n.a_border.length; n_order++) {
		//alert(n.a_border[n_order].e_oelement);
		n.a_border[n_order].e_oelement.style.visibility = 'visible';
	}
	for (var n_order = 0; n_order < n.a_children.length; n_order++) {
		//alert('set');
		n.a_children[n_order].e_oelement.style.visibility = 'visible';
	}
*/

	return delta_y;
}

function show_menu(d,coords) {
	 //alert('showing menu');
	//alert(d.a_children);
	y=d.a_border[0].e_oelement.style.top.substring(0,d.a_border[0].e_oelement.style.top.indexOf('p'))*1
	x=d.a_border[0].e_oelement.style.left.substring(0,d.a_border[0].e_oelement.style.left.indexOf('p'))*1
	delta_y = coords[1] - y;
	delta_x = coords[0] - x - 120; 
	// alert('y='+y);
	var debug = []
	for (var n_order = 0; n_order < d.a_border.length; n_order++) {
		//alert(d.a_border[n_order].e_oelement);
		y=d.a_border[n_order].e_oelement.style.top.substring(0,d.a_border[n_order].e_oelement.style.top.indexOf('p'))*1
		x=d.a_border[n_order].e_oelement.style.left.substring(0,d.a_border[n_order].e_oelement.style.left.indexOf('p'))*1
		
		d.a_border[n_order].e_oelement.style.top = ''+coords[1]+'px';//y + delta_y; //coords[1];
		d.a_border[n_order].e_oelement.style.left = ''+coords[0]-120+'px';//x + delta_x; //coords[0];
	}
	offset_x=0;
	for (var n_order = 0; n_order < d.a_children.length; n_order++) {
		//alert(d.a_border[n_order].e_oelement.style.top);
		y=d.a_children[n_order].e_oelement.style.top.substring(0,d.a_children[n_order].e_oelement.style.top.indexOf('p'))*1
		x=d.a_children[n_order].e_oelement.style.left.substring(0,d.a_children[n_order].e_oelement.style.left.indexOf('p'))*1
	//alert(y);
		debug = debug.concat([y])
		d.a_children[n_order].e_oelement.style.top = coords[1]+10+'px';//y + delta_y; //coords[1]+24;
		d.a_children[n_order].e_oelement.style.left = coords[0]-120+10+offset_x+'px';//x + delta_x; //coords[0];
		if (d.a_children[n_order].a_children != null ){
		offset_y_drop1 = coords[1]+10+24;
		for (var n2_order = 0; n2_order < d.a_children[n_order].a_children.length; n2_order++) {
		y2=d.a_children[n_order].a_children[n2_order].e_oelement.style.top.substring(0,d.a_children[n_order].a_children[n2_order].e_oelement.style.top.indexOf('p'))*1
			x2=d.a_children[n_order].a_children[n2_order].e_oelement.style.left.substring(0,d.a_children[n_order].a_children[n2_order].e_oelement.style.left.indexOf('p'))*1
			d.a_children[n_order].a_children[n2_order].e_oelement.style.top = offset_y_drop1+'px'; //y2 + delta_y; //coords[1]+y;
			d.a_children[n_order].a_children[n2_order].e_oelement.style.left = coords[0]-120+10+offset_x+'px';//x2 + delta_x; //coords[0];
			if (d.a_children[n_order].a_children[n2_order].a_children != null) {
				offset_x_drop2 = coords[0]-120+10+160;
				offset_y_drop2 = offset_y_drop1+5;
				for (var n3_order = 0; n3_order < d.a_children[n_order].a_children[n2_order].a_children.length; n3_order++) {
				y3=d.a_children[n_order].a_children[n2_order].a_children[n3_order].e_oelement.style.top.substring(0,d.a_children[n_order].a_children[n2_order].a_children[n3_order].e_oelement.style.top.indexOf('p'))*1
					x3=d.a_children[n_order].a_children[n2_order].a_children[n3_order].e_oelement.style.left.substring(0,d.a_children[n_order].a_children[n2_order].a_children[n3_order].e_oelement.style.left.indexOf('p'))*1
					d.a_children[n_order].a_children[n2_order].a_children[n3_order].e_oelement.style.top = offset_y_drop2+'px';//y3 + delta_y; //coords[1]+y;
					d.a_children[n_order].a_children[n2_order].a_children[n3_order].e_oelement.style.left = offset_x_drop2+'px';//x3 + delta_x; //coords[0];

					if (d.a_children[n_order].a_children[n2_order].a_children[n3_order].a_children != null) {
						offset_x_drop3 = coords[0]-120+10+160+160;
						offset_y_drop3 = offset_y_drop2+5;
						for (var n4_order = 0; n4_order < d.a_children[n_order].a_children[n2_order].a_children[n3_order].a_children.length; n4_order++) {
						y4=d.a_children[n_order].a_children[n2_order].a_children[n3_order].a_children[n4_order].e_oelement.style.top.substring(0,d.a_children[n_order].a_children[n2_order].a_children[n3_order].a_children[n4_order].e_oelement.style.top.indexOf('p'))*1
							x4=d.a_children[n_order].a_children[n2_order].a_children[n3_order].a_children[n4_order].e_oelement.style.left.substring(0,d.a_children[n_order].a_children[n2_order].a_children[n3_order].a_children[n4_order].e_oelement.style.left.indexOf('p'))*1
							d.a_children[n_order].a_children[n2_order].a_children[n3_order].a_children[n4_order].e_oelement.style.top = offset_y_drop3+'px';//y3 + delta_y; //coords[1]+y;
							d.a_children[n_order].a_children[n2_order].a_children[n3_order].a_children[n4_order].e_oelement.style.left = offset_x_drop3+'px';//x3 + delta_x; //coords[0];
							offset_y_drop3 = offset_y_drop3+24;
						}
					}

					offset_y_drop2 = offset_y_drop2+24;
				}
			}
			offset_y_drop1=offset_y_drop1+24;
			}
		}
		offset_x = offset_x+200;		
		
	}
	
	//alert(debug);
	if (document.forms[1] != null ) {
		document.forms[1].style.background = '#dddddd';
	}
	//alert(m);
	for (var n_order = 0; n_order < d.a_border.length; n_order++) {
		//alert(d.a_border[n_order].e_oelement);
		d.a_border[n_order].e_oelement.style.visibility = 'visible';
	}
	for (var n_order = 0; n_order < d.a_children.length; n_order++) {
		//alert('set');
		d.a_children[n_order].e_oelement.style.visibility = 'visible';
	}


	return delta_y;
}

function hide_menu(m) {
	//alert(m);
/*	if (document.forms[1] != null ) {
		document.forms[1].style.background = '#ffffff';
	}
	for (var n_order = 0; n_order < theme.a_border.length; n_order++)
		theme.a_border[n_order].e_oelement.style.visibility = 'hidden';
	for (var n_order = 0; n_order < theme.a_children.length; n_order++)
		theme.a_children[n_order].e_oelement.style.visibility = 'hidden';
	for (var n_order = 0; n_order < theme_internal.a_border.length; n_order++)
		theme_internal.a_border[n_order].e_oelement.style.visibility = 'hidden';
	for (var n_order = 0; n_order < theme_internal.a_children.length; n_order++)
		theme_internal.a_children[n_order].e_oelement.style.visibility = 'hidden';
	for (var n_order = 0; n_order < grammar.a_border.length; n_order++)
		grammar.a_border[n_order].e_oelement.style.visibility = 'hidden';
	for (var n_order = 0; n_order < grammar.a_children.length; n_order++)
		grammar.a_children[n_order].e_oelement.style.visibility = 'hidden';
	for (var n_order = 0; n_order < grammar_internal.a_border.length; n_order++)
		grammar_internal.a_border[n_order].e_oelement.style.visibility = 'hidden';
	for (var n_order = 0; n_order < grammar_internal.a_children.length; n_order++)
		grammar_internal.a_children[n_order].e_oelement.style.visibility = 'hidden';
*/	for (var x=0; x < A_MENUS.length; x++)
		A_MENUS[x].collapse();
/*	for (var n_order = 0; n_order < d2.a_border.length; n_order++)
		d2.a_border[n_order].e_oelement.style.visibility = 'hidden';
	for (var n_order = 0; n_order < d2.a_children.length; n_order++)
		d2.a_children[n_order].e_oelement.style.visibility = 'hidden';
	for (var n_order = 0; n_order < d2_internal.a_border.length; n_order++)
		d2_internal.a_border[n_order].e_oelement.style.visibility = 'hidden';
	for (var n_order = 0; n_order < d2_internal.a_children.length; n_order++)
		d2_internal.a_children[n_order].e_oelement.style.visibility = 'hidden';
*/	//this.m.visibility = 'hidden';
	//new menu (MENU_ITEMS, MENU_POS);
}

var MENU_ITEMS = [
	['Select Grammatical Category', null, null,
		['Verb', "javascript:set_field('Verb');", null,
			['Volitional Transitive Verb', "javascript:set_field('Volitional Transitive Verb');"
			],
			['Volitional Intransitive Verb', "javascript:set_field('Volitional Intransitive Verb');"
			],
			['Non-Volitional Transitive Verb', "javascript:set_field('Non-Volitional Transitive Verb');"
			],
			['Non-Volitional Intransitive Verb', "javascript:set_field('Non-Volitional Intransitive Verb');"
			],
			['Imperative', "javascript:set_field('Imperative');"
			],
			['Copula', "javascript:set_field('Copula');"
			],
			['Auxilary Verb',null,null,
				['Causitive',"javascript:set_field('Causitive');"],
				['Resultative',"javascript:set_field('Resultative');"],
			]
		],
		['Adverb', "javascript:set_field('Adverb');", null,
			['Connective', "javascript:set_field('Connective');"]
		],
		['Noun', "javascript:set_field('Noun');"],
		['Pronoun', "javascript:set_field('Pronoun');", null,
			['Personal Pronoun', "javascript:set_field('Personal Pronoun');"],
			['Interrogative Pronoun', "javascript:set_field('Interrogative Pronoun');"]
		],
		['Pre-Nominal Modifier', "javascript:set_field('Pre-Nominal Modifier');"],
		['Adjective', "javascript:set_field('Adjective');"],
		['Determinative', "javascript:set_field('Determinative');", null,
			['Numeral', "javascript:set_field('Numeral');"],
			['Demonstrative', "javascript:set_field('Demonstrative');"],
			['Quantifier', "javascript:set_field('Quantifier');"]
		],
		['Case Particle', "javascript:set_field('Case Particle');"],
		['Nominalizer', "javascript:set_field('Nominalizer');"],			
	],
	['Cancel',null,null]
];

var oldDialects = [
	['Select Dialect', null, null,
		['One', "javascript:set_field('Verb','dialect');", null,
			['sub 1', "javascript:set_field('Volitional Transitive Verb','dialect');"
			],
			['sub 2', "javascript:set_field('Volitional Intransitive Verb','dialect');"
			]
		],
		['two', "javascript:set_field('Adverb','dialect');", null,
			['sub 3', "javascript:set_field('Connective','dialect');"]
		]
	],
	['Cancel',null,null]
];

var Dialects = [
	['Choose Dialect', null, null,

		['Stndard Tibetan', "javascript:set_field('Stndard Tibetan','major_dialect');",null,


			['standard Tibetan', "javascript:set_field('Stndard Tibetan','major_dialect');set_field('standard Tibetan','specific_dialect');"
			],
	

			['unspecified', "javascript:set_field('Stndard Tibetan','major_dialect');set_field('unspecified','specific_dialect');"
			],
	

			['other', "javascript:set_field('Stndard Tibetan','major_dialect');set_field('other','specific_dialect');"
			]
	

		],

		['Ütsang', "javascript:set_field('Ütsang','major_dialect');",null,


			['Central dialect', "javascript:set_field('Ütsang','major_dialect');set_field('Central dialect','specific_dialect');"
			],
	

			['Lhasa dialect', "javascript:set_field('Ütsang','major_dialect');set_field('Lhasa dialect','specific_dialect');"
			],
	

			['Lhokha dialect', "javascript:set_field('Ütsang','major_dialect');set_field('Lhokha dialect','specific_dialect');"
			],
	

			['Kongpo dialect', "javascript:set_field('Ütsang','major_dialect');set_field('Kongpo dialect','specific_dialect');"
			],
	

			['Tsang dialect', "javascript:set_field('Ütsang','major_dialect');set_field('Tsang dialect','specific_dialect');"
			],
	

			['Tö dialect', "javascript:set_field('Ütsang','major_dialect');set_field('Tö dialect','specific_dialect');"
			],
	

			['unspecified', "javascript:set_field('Ütsang','major_dialect');set_field('unspecified','specific_dialect');"
			],
	

			['other', "javascript:set_field('Ütsang','major_dialect');set_field('other','specific_dialect');"
			]
	

		],

		['Kham/Hor', "javascript:set_field('Kham/Hor','major_dialect');",null,


			['Central Kham dialect', "javascript:set_field('Kham/Hor','major_dialect');set_field('Central Kham dialect','specific_dialect');"
			],
	

			['Southern Kham dialect', "javascript:set_field('Kham/Hor','major_dialect');set_field('Southern Kham dialect','specific_dialect');"
			],
	

			['Northeastern Kham dialect', "javascript:set_field('Kham/Hor','major_dialect');set_field('Northeastern Kham dialect','specific_dialect');"
			],
	

			['Hor dialect', "javascript:set_field('Kham/Hor','major_dialect');set_field('Hor dialect','specific_dialect');"
			],
	

			['unspecified', "javascript:set_field('Kham/Hor','major_dialect');set_field('unspecified','specific_dialect');"
			],
	

			['other', "javascript:set_field('Kham/Hor','major_dialect');set_field('other','specific_dialect');"
			]
	

		],

		['Amdo', "javascript:set_field('Amdo','major_dialect');",null,


			['North Kokonor Amdo dialect', "javascript:set_field('Amdo','major_dialect');set_field('North Kokonor Amdo dialect','specific_dialect');"
			],
	

			['West Kokonor Amdo dialect', "javascript:set_field('Amdo','major_dialect');set_field('West Kokonor Amdo dialect','specific_dialect');"
			],
	

			['Southeast Kokonor Amdo dialect', "javascript:set_field('Amdo','major_dialect');set_field('Southeast Kokonor Amdo dialect','specific_dialect');"
			],
	

			['South Gansu Amdo dialect', "javascript:set_field('Amdo','major_dialect');set_field('South Gansu Amdo dialect','specific_dialect');"
			],
	

			['Golok Amdo dialect', "javascript:set_field('Amdo','major_dialect');set_field('Golok Amdo dialect','specific_dialect');"
			],
	

			['Ngapa Amdo dialect', "javascript:set_field('Amdo','major_dialect');set_field('Ngapa Amdo dialect','specific_dialect');"
			],
	

			['unspecified', "javascript:set_field('Amdo','major_dialect');set_field('unspecified','specific_dialect');"
			],
	

			['other', "javascript:set_field('Amdo','major_dialect');set_field('other','specific_dialect');"
			]
	

		],

		['Tewo and Choni', "javascript:set_field('Tewo and Choni','major_dialect');",null,


			['Tewo dialect', "javascript:set_field('Tewo and Choni','major_dialect');set_field('Tewo dialect','specific_dialect');"
			],
	

			['Choni dialect', "javascript:set_field('Tewo and Choni','major_dialect');set_field('Choni dialect','specific_dialect');"
			],
	

			['unspecified', "javascript:set_field('Tewo and Choni','major_dialect');set_field('unspecified','specific_dialect');"
			],
	

			['other', "javascript:set_field('Tewo and Choni','major_dialect');set_field('other','specific_dialect');"
			]
	

		],

		['Dzongkha-Sikkimese', "javascript:set_field('Dzongkha-Sikkimese','major_dialect');",null,


			['Dzongkha', "javascript:set_field('Dzongkha-Sikkimese','major_dialect');set_field('Dzongkha','specific_dialect');"
			],
	

			['Khyöcha Ngachakha', "javascript:set_field('Dzongkha-Sikkimese','major_dialect');set_field('Khyöcha Ngachakha','specific_dialect');"
			],
	

			['Lakha', "javascript:set_field('Dzongkha-Sikkimese','major_dialect');set_field('Lakha','specific_dialect');"
			],
	

			['Merak Sakteng nomad dialect', "javascript:set_field('Dzongkha-Sikkimese','major_dialect');set_field('Merak Sakteng nomad dialect','specific_dialect');"
			],
	

			['Dur nomad dialect', "javascript:set_field('Dzongkha-Sikkimese','major_dialect');set_field('Dur nomad dialect','specific_dialect');"
			],
	

			['Sikkimese', "javascript:set_field('Dzongkha-Sikkimese','major_dialect');set_field('Sikkimese','specific_dialect');"
			],
	

			['unspecified', "javascript:set_field('Dzongkha-Sikkimese','major_dialect');set_field('unspecified','specific_dialect');"
			],
	

			['other', "javascript:set_field('Dzongkha-Sikkimese','major_dialect');set_field('other','specific_dialect');"
			]
	

		],

		['Sherpa-Jirel', "javascript:set_field('Sherpa-Jirel','major_dialect');",null,


			['Sherpa Solu dialect', "javascript:set_field('Sherpa-Jirel','major_dialect');set_field('Sherpa Solu dialect','specific_dialect');"
			],
	

			['Spiti dialect', "javascript:set_field('Sherpa-Jirel','major_dialect');set_field('Spiti dialect','specific_dialect');"
			],
	

			['Nyam dialect', "javascript:set_field('Sherpa-Jirel','major_dialect');set_field('Nyam dialect','specific_dialect');"
			],
	

			['unspecified', "javascript:set_field('Sherpa-Jirel','major_dialect');set_field('unspecified','specific_dialect');"
			],
	

			['other', "javascript:set_field('Sherpa-Jirel','major_dialect');set_field('other','specific_dialect');"
			]
	

		],

		['Lahul-Spiti', "javascript:set_field('Lahul-Spiti','major_dialect');",null,


			['Balti dialect', "javascript:set_field('Lahul-Spiti','major_dialect');set_field('Balti dialect','specific_dialect');"
			],
	

			['Ladakhi', "javascript:set_field('Lahul-Spiti','major_dialect');set_field('Ladakhi','specific_dialect');"
			],
	

			['Purik dialect', "javascript:set_field('Lahul-Spiti','major_dialect');set_field('Purik dialect','specific_dialect');"
			]
	

		],

		['Ladakhi/Balti', "javascript:set_field('Ladakhi/Balti','major_dialect');",null,


			['Kyirong dialect', "javascript:set_field('Ladakhi/Balti','major_dialect');set_field('Kyirong dialect','specific_dialect');"
			],
	

			['Kagate dialect', "javascript:set_field('Ladakhi/Balti','major_dialect');set_field('Kagate dialect','specific_dialect');"
			],
	

			['Tsum dialect', "javascript:set_field('Ladakhi/Balti','major_dialect');set_field('Tsum dialect','specific_dialect');"
			],
	

			['Langtang dialect', "javascript:set_field('Ladakhi/Balti','major_dialect');set_field('Langtang dialect','specific_dialect');"
			]
	

		],

		['Kyirong-Kagate', "javascript:set_field('Kyirong-Kagate','dialect');",null,


		],

	],
	['Cancel',null,null]	
];