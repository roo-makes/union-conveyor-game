using System;
using System.Collections;
using System.Collections.Generic;
using Sirenix.OdinInspector;
using UnityEngine;

public class ZoneWidgetTracker : MonoBehaviour
{
    private List<GameObject> widgetsInZone = new List<GameObject>();

    public List<GameObject> Widgets => widgetsInZone;
    
    private void OnTriggerEnter2D(Collider2D other)
    {
        widgetsInZone.Add(other.gameObject);
    }

    private void OnTriggerExit2D(Collider2D other)
    {
        widgetsInZone.Remove(other.gameObject);
    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
