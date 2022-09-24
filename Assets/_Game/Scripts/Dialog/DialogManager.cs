using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Ink.Runtime;
using TMPro;
using UnityEngine;

public class DialogManager : MonoBehaviour
{
    [SerializeField] private TextAsset _inkAsset;
    [SerializeField] private TextMeshProUGUI _textBox;
    private Story _inkStory;

    public enum DialogType
    {
        Standard,
        StageDirection,
        Choices
    }

    public bool CanContinue => _inkStory.canContinue;
    public bool IsChoice => !CanContinue && _inkStory.currentChoices.Count > 0;
    public string DialogText => _inkStory.currentText;
    public 

    void Awake()
    {
        _inkStory = new Story(_inkAsset.text);
    }

    public void Advance()
    {
        if (CanContinue) _inkStory.Continue();
    }
    
    

    public string GetNextStoryText()
    {
        return _inkStory.Continue();
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
