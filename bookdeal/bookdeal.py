import re
class Article:
    def __init__(self,title):
        self.title = title
        self.content = ''
    def ToString(self):
        return self.title + '\n' + self.content
with open('./test.txt','r',encoding='utf-8') as target:
    isStart = True
    articleList = []
    contentTemp = ''
    index = -1
    for line in target.readlines():
        # print(line)
        if re.match(r'第.*章：',line) is not None:
            index += 1
            articleList.append(Article(line))

        else:
            if len(articleList) > 0:
                articleList[index].content += line + '\n'
    print(articleList[0].ToString())