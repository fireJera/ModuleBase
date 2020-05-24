个人微信号：r913218338，欢迎随时交流

## 制作一个支持SPM(swift package manager)、carthage和cocoapods的过程

###首先支持carthage

 不建议先支持SPM 因为spm会在.gitignore中添加忽略工程配置文件

 1.  先在xcode中新建一个framework，然后在framework中添加源文件等等
 2. 源文件建立后新建一个target：single view app，在新的target中示范如何使用framework。
 3. 打开控制台，在控制台中cd到 项目目录，然后在控制台中运行下面的命令： 
	
	 	carthage build --no-skip-current
	 
 4. 如果出现下面的结果，carthage就弄完了

PS: 第三部应该是验证能不能创建carthage库，不运行该命令直接提交应该也没问题

### 然后是cocoapods

1. 首先生成一个podspec文件，在文件中配置相关内容， 也可以通过第二个命令直接生成相应的xcode项目

		pod spec create YourLib

		pod lib create YouLib
	
2. 然后在这个文件里配置项目，接下来给git 打上标签 提交到 github上

 	$ git tag "0.0.01"
 	$ git push --tags

3. 然后使用下面的命令验证podspec 是否是有效的：

		$ pod spec lint --verbose --allow-warngings
	
4. 这时候可能会提示下面的错误，可以重新打个tag 0.0.2 然后再次验证就可以通过了: 
**-> ModuleBase (0.0.1)
    - ERROR | [iOS] file patterns: The `source_files` pattern did not match any file.**

5. 如果想删除旧的tag。先删除本地的，然后再删除服务器的

	$ git tag -d "0.0.1"
	$ git push origin :refs/tags/0.0.1
	// 批量删除tag
	$ git tag -l| xargs git tag -d
	$ git show-ref --tag | xargs git push origin
	
	$ git tag -l | awk '/tag_20180[1-5]{1}/{print}' | xargs git push origin --delete tag


6. 这时候就可以验证通过了, 验证通过后，还需要向cocoapods注册你的库。然后会发一封邮件到你的邮箱，你需要去邮箱确认一下。邮箱确认完之后，需要把你podspec提交到cocoapods

		$ pod trunk register yourenmail@xxx.com 'YouName'
		$ pod trunk push YouPodLib.podspec 


7. 然后去搜索你自己的库，

		pod search YourPodLib

8. 可能会出现搜不到的情况。这时候一般需要多不操作，
	
		rm ~/Library/Caches/CocoaPods/search_index.json
		pod setup
	
	
9. 关于库更新的情况。更新后有时间延迟，估计要半个小时的样子。需要把你的pospec文件提交到cocoapods中去更新你的库.如果想撤回已存在的版本，需要用到删除命令

		$ pod trunk delete YourLibName version
		
		$ pod trunk delete ModuleBase 0.0.3
	
10. 创建私有库之后更新
	

### 最后是SPM

1. 直接执行命令

		$ swift package init

2. 可以使用两个命令来测试库

		$ swift build
		$ swift test
		
		
3. 然后就可以提交github 在项目中使用了。

## 题外话 如果想删除整个git repo的历史记录并且把整个repo 清空

		$ git checkout --orphan latest_branch

		$ git add -A
		
		$ git commit -am "commit message"
		
		$ git branch -D master
		
		$ git branch -m master
		
		$ git push -f origin master
	
