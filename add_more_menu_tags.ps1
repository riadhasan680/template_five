
$tagsToAdd = @("PC Gaming Show", "Software", "Movies & TV", "Codes", "Coupons")
$postsDir = "c:\Users\User\Document\work-job\template_five\content\posts"
$posts = Get-ChildItem -Path $postsDir -Filter "*.md"

Write-Host "Found $($posts.Count) posts."

foreach ($post in $posts) {
    $content = Get-Content $post.FullName -Raw
    
    if ($content -match "(?ms)^---\r?\n(.*?)\r?\n---") {
        $frontmatter = $matches[1]
        
        if ($frontmatter -match "tags:\s*\[(.*?)\]") {
            $currentTagsContent = $matches[1]
            $currentTags = $currentTagsContent.Split(',') | ForEach-Object { 
                $_.Trim().Trim('"').Trim("'") 
            } | Where-Object { $_ -ne "" }
            
            $newTags = $currentTags
            $modified = $false
            
            foreach ($tagToAdd in $tagsToAdd) {
                # 20% chance to add each tag
                if ((Get-Random -Minimum 0 -Maximum 100) -lt 20) {
                    if ($newTags -notcontains $tagToAdd) {
                        $newTags += $tagToAdd
                        $modified = $true
                        Write-Host "Adding '$tagToAdd' to $($post.Name)"
                    }
                }
            }
            
            if ($modified) {
                $newTagsStr = "tags: [" + (($newTags | ForEach-Object { "`"$_`"" }) -join ", ") + "]"
                $newContent = $content -replace "tags:\s*\[.*?\]", $newTagsStr
                Set-Content -Path $post.FullName -Value $newContent -Encoding UTF8
            }
        }
    }
}

Write-Host "More menu tags populated."
