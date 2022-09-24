using System.Collections;
using System.Collections.Generic;
using Ink.Runtime;
using TMPro;
using UnityEngine;

public class DialogManager : MonoBehaviour
{
    [SerializeField] private TextAsset _inkAsset;
    [SerializeField] private TextMeshProUGUI _textBox;
    private Story _inkStory;

    void Awake()
    {
        _inkStory = new Story(_inkAsset.text);
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
