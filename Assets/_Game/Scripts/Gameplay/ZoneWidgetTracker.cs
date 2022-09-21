using System;
using System.Collections;
using System.Collections.Generic;
using _Game.Scripts.Gameplay;
using Sirenix.OdinInspector;
using UnityEngine;
using UnityEngine.Events;

public class ZoneWidgetTracker : MonoBehaviour
{
    [SerializeField] private string widgetTag;
    [SerializeField] private UnityEvent<GameObject> widgetEntered;
    [SerializeField] private UnityEvent<GameObject> widgetExited;

    private ZoneStateData _zoneStateData;
    
    void Awake()
    {
        _zoneStateData = GetComponent<ZoneStateData>();
    }

    private void OnTriggerEnter2D(Collider2D other)
    {
        if (other.CompareTag(widgetTag))
        {
            _zoneStateData.AddWidget(other.gameObject);
            widgetEntered.Invoke(other.gameObject);
        }
    }

    private void OnTriggerExit2D(Collider2D other)
    {
        if (other.CompareTag(widgetTag)) {
            _zoneStateData.RemoveWidget(other.gameObject);
            widgetExited.Invoke(other.gameObject);
        }
    }
}