{
    # Theme information
    'name': "dourawards",
    'description': """dourawards site 主题""",
    'category': 'Theme',
    'version': '0.1',
    'depends': ['website'],

    # templates
    'data': [
        'views/options.xml',
        'views/snippets.xml',
    ],
    'images': [
        'static/description/cover.png',
        'static/description/theme_default_screenshot.jpg',
    ],
    'snippet_lists': {
        'homepage': ['s_cover', 's_text_image', 's_numbers'],
        'about_us': ['s_text_image', 's_image_text', 's_title', 's_company_team'],
        'our_services': ['s_three_columns', 's_quotes_carousel', 's_references'],
        'pricing': ['s_comparisons'],
        'privacy_policy': ['s_faq_collapse'],
    },
    # demo pages
    'demo': [
        'demo/pages.xml',
    ],

    # Your information
    'author': "dafengstudio",
    'website': "https://www.dafengstudio.com",
}
