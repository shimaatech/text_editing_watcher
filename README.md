# text_editing_watcher

A widget that rebuilds when text is changed in TextEditingController

## Getting Started

This simple widget can be used in order to rebuild other widgets based on changes in TextEditingController

```dart
              TextEditingWatcher(
                controller: _controller,
                builder: (text) => Text(
                  'You typed: $text',
                  textAlign: TextAlign.start,
                ),
              )

```

```dart
          // use TextEditingWatcher for disabling butting when text is empty
          TextEditingWatcher(
            controller: _controller,
            builder: (text) => RaisedButton(
              child: Text('submit'),
              onPressed: text.isNotEmpty ? () {} : null,
            ),
          )
```