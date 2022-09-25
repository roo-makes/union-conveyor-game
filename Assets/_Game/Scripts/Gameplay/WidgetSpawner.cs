using UnityEngine;
using UnityEngine.Events;

namespace _Game.Scripts.Gameplay
{
    public class WidgetSpawner : MonoBehaviour
    {
        [SerializeField] private UnityEvent<GameObject> spawnedWidget;
        
        void Start()
        {
            SpawnWidget();
            InvokeRepeating("SpawnWidget", 0, 2);
        }
        
        public void SpawnWidget()
        {
            var widgetGO = WidgetPool.Instance.GetWidget();
            widgetGO.transform.SetParent(transform);
            widgetGO.transform.position = transform.position;
            spawnedWidget.Invoke(widgetGO);
        }
    }
}