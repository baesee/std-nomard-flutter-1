# Toonflix

노마드코드 Flutter 강의

## 개발 환경 설정

### 개발환경 편의를 위한 설정

Dart/Flutter 개발을 위한 권장 설정입니다. `settings.json`에 다음 설정을 추가하세요:

```json
{
    "dart.previewFlutterUiGuides": true,
    "[dart]": {
        "editor.codeActionsOnSave": {
            "source.fixAll": "explicit"
        },
        "editor.formatOnSave": true,
        "editor.formatOnType": true,
        "editor.rulers": [80],
        "editor.selectionHighlight": false,
        "editor.suggest.snippetsPreventQuickSuggestions": false,
        "editor.suggestSelection": "first",
        "editor.tabCompletion": "onlySnippets",
        "editor.wordBasedSuggestions": "off"
    }
}
```

#### 설정 설명

-   `dart.previewFlutterUiGuides`: Flutter UI 가이드라인을 미리보기로 표시
-   `editor.codeActionsOnSave`: 파일 저장 시 자동으로 코드 수정사항을 적용 (explicit 모드)
-   `editor.formatOnSave`: 파일 저장 시 자동 포맷팅
-   `editor.formatOnType`: 타이핑할 때마다 자동 포맷팅
-   `editor.rulers`: 80자 기준 세로 줄 표시
-   `editor.selectionHighlight`: 선택한 텍스트와 동일한 텍스트 하이라이트 비활성화
-   `editor.suggest.snippetsPreventQuickSuggestions`: 스니펫 제안이 빠른 제안을 방해하지 않도록 설정
-   `editor.suggestSelection`: 제안 목록에서 첫 번째 항목 자동 선택
-   `editor.tabCompletion`: 탭 완성 기능을 스니펫에만 적용
-   `editor.wordBasedSuggestions`: 현재 파일의 단어 기반 제안 기능 비활성화
